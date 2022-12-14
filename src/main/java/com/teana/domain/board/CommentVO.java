package com.teana.domain.board;

import com.google.protobuf.Timestamp;

import lombok.Data;

@Data
public class CommentVO {
	private Integer cno;
	private Integer bno;
	private String member_id;
	private String name;
	private String c_content;
	private Timestamp c_regdate;
	private Timestamp c_updatedate;
	private Integer c_re_ref;
	private Integer c_re_lev;
	private Integer c_re_seq;

}
