package controller;

import com.entity.Email;
import com.service.EmailService;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.List;

/**
 * Created by BF on 2017/5/23.
 */
@Controller
@RequestMapping(value = "email")
public class EmailController
{
    /**
     * 注入依赖
     */
    @Autowired
    private EmailService emailService;

    @RequestMapping(value = "save", method = RequestMethod.POST)
    @ResponseBody
    public int save(HttpServletRequest request, @RequestParam(value = "myfile", required = false) MultipartFile file)
    {
        Email email = new Email();
        int back = 0;
        if (file != null)
        {
            //1、创建一个DiskFileItemFactory工厂
            DiskFileItemFactory factory = new DiskFileItemFactory();
            //2、创建一个文件上传解析器
            ServletFileUpload upload = new ServletFileUpload(factory);
            //解决上传文件名的中文乱码
            upload.setHeaderEncoding("UTF-8");
            factory.setSizeThreshold(1024 * 500);//设置内存的临界值为500K
            String savePath = request.getServletContext().getRealPath("/WEB-INF/upload");
            String fileName = file.getOriginalFilename();
            System.out.println(savePath);
            email.setFileroad(savePath + "\\" + fileName);
            File linshi = new File(savePath);//当超过500K的时候，存到一个临时文件夹中
            if (!linshi.exists())
            {
                linshi.mkdirs();
            }
            factory.setRepository(linshi);
            try
            {
                InputStream in = file.getInputStream();
                FileOutputStream out = new FileOutputStream(savePath + "\\" + fileName);
                //创建一个缓冲区
                byte buffer[] = new byte[1024];
                //判断输入流中的数据是否已经读完的标识
                int len = 0;
                //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
                while ((len = in.read(buffer)) > 0)
                {
                    //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
                    out.write(buffer, 0, len);
                }
                //关闭输入流
                in.close();
                //关闭输出流
                out.close();
                System.out.println("上传成功");
            }

            catch (IOException e)
            {
                System.out.println("上传失败");
                back = 2;
            }
        }
        else
        {
            email.setFileroad(null);
        }
        email.setAddressee(request.getParameter("comeemail"));
        email.setSender(request.getParameter("sender"));
        email.setSenderemail(request.getParameter("senderemail"));
        email.setTitle(request.getParameter("title"));
        email.setTest(request.getParameter("info"));
        back = emailService.addEmail(email);
        return back;
    }

    @RequestMapping(value = "querryone", method = RequestMethod.GET)
    public String queryemail(int emailID, Model model)
    {
        Email email = emailService.searchEmail(emailID);
        model.addAttribute("email", email);
        return "static/system/email/emailshow";
    }

    @RequestMapping(value = "querryall",method = RequestMethod.GET)
    public String allemail(Model model,HttpServletRequest request)
    {
        List<Email> list = emailService.searchall();
        System.out.println(list.toString());
        model.addAttribute("list",list);
        return "static/system/email/allemail";
    }
    /**
     * 下载文件
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "download", method = RequestMethod.GET)
    public ResponseEntity<byte[]> download(HttpServletRequest request) throws IOException
    {
        String aa = request.getParameter("file");
        /**
         * 获取相对目录
         */
        String savePath = request.getServletContext().getRealPath("/WEB-INF/upload");
        System.out.println(savePath);
        String fileroad = new String(aa.getBytes("iso8859-1"), "UTF-8");
        File file = new File(fileroad);
        byte[] body = null;
        InputStream is = new FileInputStream(file);
        body = new byte[is.available()];
        is.read(body);
        HttpHeaders headers = new HttpHeaders();

        String fileName = new String(file.getName().getBytes("UTF-8"), "iso-8859-1");//为了解决中文名称乱码问题
        System.out.println(fileName);
        headers.setContentDispositionFormData("attachment", fileName);

        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }

}
