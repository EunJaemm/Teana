package com.teana.domain.board;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO {
	private Integer bno;
	private String member_id;
	private String name;
	private String b_ctgr;
	private String b_title;
	private String b_content;
	private Timestamp b_regdate;
	private Timestamp b_updatedate;
	private Integer b_readcount;
	private String b_file;
	private Integer b_cmtcount;
}
