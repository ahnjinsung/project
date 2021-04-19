package com.maet.command;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FindUserVO {
	private String userId;
	private String userPw;
	private String userEmail;
	private String userUUID;
}
