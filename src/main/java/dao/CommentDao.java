package dao;

import entity.Comment;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by fordevelopment on 15/6/24.
 */
public interface CommentDao {
    List get_all_comment(String id);

    void add_comment(String stockCode, String comment, Integer id);
}
