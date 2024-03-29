package com.ktds.jspservlet.service;

import com.ktds.jspservlet.dto.UserDTO;
import com.ktds.jspservlet.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private UserDTO userDTO;

    public int join(UserDTO userDTO) {
        return userRepository.join(userDTO);
    }


    public int isUsernameAvailable(String userId) {
        int result = userRepository.countByUserId(userId);
        return result;
    }

    public int checkId(String id) {
        int result = 0;
        result = userRepository.checkId(id);
        return result;
    }

    public UserDTO validateUser(String userId, String userPassword) {
        UserDTO user = userRepository.findByUserId(userId);
        if(user != null && user.getUserPassword().equals(userPassword)){
            return user;
        };
        return null;
    }
}
