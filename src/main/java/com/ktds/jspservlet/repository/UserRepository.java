package com.ktds.jspservlet.repository;

import com.ktds.jspservlet.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class UserRepository {
    private final SqlSessionTemplate sql;

    public int join(UserDTO userDTO) {
        return sql.insert("User.join", userDTO);
    }

    public int countByUserId(String userId) {
        return sql.selectOne("User.countByUsername", userId);
    }

    public int checkId(String userId) {
        return sql.selectOne("User.countByUsername", userId);
    }

    public UserDTO findByUserId(String userId) {
        return sql.selectOne("User.findByUserId", userId);
    }
}
