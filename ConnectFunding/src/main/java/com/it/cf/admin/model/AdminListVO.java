package com.it.cf.admin.model;

import java.util.List;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class AdminListVO {
	private List<AdminVO> selectAdmin;
}
