package com.zhaotianyue.cms.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.zhaotianyue.cms.condition.Constant;
import com.zhaotianyue.cms.entity.Article;
import com.zhaotianyue.cms.entity.Category;
import com.zhaotianyue.cms.entity.Channel;
import com.zhaotianyue.cms.entity.Collect;
import com.zhaotianyue.cms.entity.User;
import com.zhaotianyue.cms.mapper.ArticleEs;
import com.zhaotianyue.cms.service.ArticleService;
import com.zhaotianyue.cms.service.CollectService;
import com.zhaotianyue.cms.service.UserService;
import com.zhaotianyue.cms.utils.FileUtils;
import com.zhaotianyue.cms.utils.HtmlUtils;
import com.zhaotianyue.cms.utils.StringUtils;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Value("${upload.path}")
	String picRootPath;
	
	@Autowired
	ArticleEs ae;
	
	@Autowired
	UserService us;
	
	@Autowired
	CollectService collectService;
	
	@Autowired
	ArticleService as;
	
	@Autowired
	KafkaTemplate kafkaTemplate;
	
	//进入登录/注册页面
	@RequestMapping("register_login")
	public String register_login(User u,Model m) {
		m.addAttribute("u",u);
		return "user/register_login";
	}
	//前台唯一验证姓名查询
	@ResponseBody
	@RequestMapping("checkname")
	public boolean checkname(String username) {
		User u = us.isHasName(username);
		return u==null;
	}
	//注册加后台验证
	@RequestMapping(value="register",method=RequestMethod.POST)
	public String register(@Valid@ModelAttribute("u")User u,BindingResult result,Model m) {
		if (result.hasErrors()) {
			m.addAttribute("cls", "right-panel-active");
			return "user/register_login";
		}
		boolean flag = us.add(u);
		if(flag) {
			return "redirect:register_login";
		}else {
			m.addAttribute("cls", "right-panel-active");
			m.addAttribute("error","注册失败,请稍后再试!");
			return "user/register_login";
		}
	}
	//登录加后台验证
	@RequestMapping("login")
	public String login(@ModelAttribute("u") User u,Model m,HttpServletResponse response,HttpServletRequest request,String denglu) {
		String pwd =  new String(u.getPassword());
		User user = us.onlyUser(u);
		if(user!=null) {
			request.getSession().setAttribute(Constant.ONLYUSER,user);
			
			//保存用户的用户名和密码
			if(denglu!=null) {
				Cookie cookieUserName = new Cookie("username", user.getUsername());
				cookieUserName.setPath("/");
				cookieUserName.setMaxAge(10*24*3600);// 10天
				response.addCookie(cookieUserName);
				Cookie cookieUserPwd = new Cookie("userpwd", pwd);
				cookieUserPwd.setPath("/");
				cookieUserPwd.setMaxAge(10*24*3600);// 10天
				response.addCookie(cookieUserPwd);
			}
			
			if(user.getRole().equals(Constant.COMMONUSERS)) {
				return "redirect:home";
			}else {
				return "redirect:/admin/index";
			}
		}else {
			m.addAttribute("error", "密码或账号错误,请重新登录!");
			return "user/register_login";
		}
	}
	//用户登录界面
	@RequestMapping("home")
	public String home(User u,Model m,HttpServletRequest request) {
		return "user/home";
	}
	//用户登录个人文章展示
	@RequestMapping("articles")
	public String articles(@RequestParam(defaultValue = "1")int pageNum,HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute(Constant.ONLYUSER);
		
		PageInfo<Article> pg=as.listByUser(u.getId(),pageNum);
		request.setAttribute("pg", pg);
		return "user/article/list";
	}
	//我的收藏展示
	@RequestMapping("collect")
	public String collect(@RequestParam(defaultValue = "1")int pageNum,HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute(Constant.ONLYUSER);
		PageInfo<Collect> pg = collectService.listCollect(u.getId(),pageNum);
		
		request.setAttribute("pg", pg);
		return "user/article/collect";
	}
	//进入添加收藏页面
	@RequestMapping("addcollect")
	public String addcollect(Collect collect,Model m) {
		m.addAttribute("collect", collect);
		return "user/article/addcollect";
	}
	//进入添加收藏页面
	@RequestMapping("addcoll")
	public String addcoll(@Valid@ModelAttribute("collect")Collect collect,BindingResult result,HttpServletRequest request,Model m) {
		if(StringUtils.isHttpUrl(collect.getUrl())) {
			User u = (User) request.getSession().getAttribute(Constant.ONLYUSER);
			collect.setUserId(String.valueOf(u.getId()));
			collectService.save(collect);
			return "redirect:home";
		}else {
			m.addAttribute("msg","地址错误!");
			return "user/article/addcollect";
		}
		
	}
	//用户登录个人文章逻辑删除
	@ResponseBody
	@RequestMapping("deletecollect")
	public boolean deletecollect(int id) {
		int result  = collectService.delete(id);
		return result > 0;
	}
	
	//用户登录个人文章展示
	@RequestMapping("postArticle")
	public String postArticle(HttpServletRequest request) {
		List<Channel> channels= as.getChannels();
		request.setAttribute("channels", channels);
		return "user/article/post";
	}
	//获得分类
	@RequestMapping("getCategoris")
	@ResponseBody
	public List<Category>  getCategoris(int cid) {	
		List<Category> categoris = as.getCategorisByCid(cid);
		return categoris;
	}
	//个人添加文章
	@RequestMapping("addArticle")
	@ResponseBody
	public boolean addArticle(HttpServletRequest request, Article article, 
			MultipartFile file
			) {
		
		
		String picUrl;
		try {
			// 处理上传文件
			picUrl = processFile(file);
			article.setPicture(picUrl);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//当前用户是文章的作者
		User loginUser = (User)request.getSession().getAttribute(Constant.ONLYUSER);
		article.setUser_id(loginUser.getId());
		
		article.setArticleType(0);
		String jsonString = JSON.toJSONString(article);
		jsonString="add="+jsonString;
		kafkaTemplate.send("articles", jsonString);
		return as.add(article)>0;
		
		
		
	}
	//保存图片并获取路径
	private String processFile(MultipartFile file) throws IllegalStateException, IOException {
		
		if(file.isEmpty() )
			return "";
		
		// 判断目标目录时间否存在
		//picRootPath + ""
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String subPath = sdf.format(new Date());
		//图片存放的路径
		File path= new File(picRootPath+"/" + subPath);
		//路径不存在则创建
		if(!path.exists())
			path.mkdirs();
		
		//计算新的文件名称
		String suffixName = FileUtils.getSuffixName(file.getOriginalFilename());
		
		//随机生成文件名
		String fileName = UUID.randomUUID().toString() + suffixName;
		//文件另存
		file.transferTo(new File(picRootPath+"/" + subPath + "/" + fileName));
		return  subPath + "/" + fileName;
		
	}
	/**
	 * 跳转到修改文章的页面
	 * @return
	 */
	@RequestMapping("updArticle")
	public String updArticle(HttpServletRequest request,int id) {	
		
		//获取栏目
		List<Channel> channels= as.getChannels();
		request.setAttribute("channels", channels);
		
		//获取文章
		Article article = as.getById(id);
		User loginUser = (User)request.getSession().getAttribute(Constant.ONLYUSER);
		if(loginUser.getId() != article.getUser_id()) {
			// todo 准备做异常处理的！！
		}
		request.setAttribute("article", article);
		request.setAttribute("content1",  HtmlUtils.htmlspecialchars(article.getContent()));
		
		
		return "user/article/update";
	}
	//个人添加文章
	@RequestMapping("updateArticle")
	@ResponseBody
	public boolean updateArticle(HttpServletRequest request, Article article, MultipartFile file) {
		
		String picUrl;
		try {
			// 处理上传文件
			picUrl = processFile(file);
			if(StringUtils.hasValue(picUrl))
					article.setPicture(picUrl);
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//当前用户是文章的作者
		User loginUser = (User)request.getSession().getAttribute(Constant.ONLYUSER);
		
		
		article.setArticleType(0);
		
		
		return as.update(article,loginUser.getId())>0;
		
	}
	
	@RequestMapping("logout")
	public String home(HttpServletRequest request,HttpServletResponse response) {
		request.getSession().removeAttribute(Constant.ONLYUSER);
		Cookie cookieUserName = new Cookie("username", "");
		cookieUserName.setPath("/");
		cookieUserName.setMaxAge(0);// 立即过期
		response.addCookie(cookieUserName);
		Cookie cookieUserPwd = new Cookie("userpwd", "");
		cookieUserPwd.setPath("/");
		cookieUserPwd.setMaxAge(0);// 立即过期
		response.addCookie(cookieUserPwd);
		return "redirect:/";
	}
}
