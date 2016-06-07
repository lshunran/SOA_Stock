package service;

import dao.CommentDao;
import entity.Comment;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by fordevelopment on 15/6/24.
 */
@Transactional
@Service
public class CommentService {
    @Autowired
    CommentDao commentDao;


    public List<Comment> get_all_comment(String stockCode)
    {
        //JSONArray jsonArray = JSONArray.fromObject(commentDao.get_all_comment(stockCode));
        return commentDao.get_all_comment(stockCode);
    }

    public String get_all_comment_json(String stockCode)
    {
        JSONArray jsonArray = JSONArray.fromObject(commentDao.get_all_comment(stockCode));
        return jsonArray.toString();
    }


    public void add_comment(String stockCode, String comment, Integer id) {
        commentDao.add_comment(stockCode,comment,id);
    }
}
