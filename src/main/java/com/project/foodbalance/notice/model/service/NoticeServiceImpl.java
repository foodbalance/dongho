package com.project.foodbalance.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.foodbalance.common.Paging;
import com.project.foodbalance.common.SearchDate;
import com.project.foodbalance.notice.model.dao.NoticeDao;
import com.project.foodbalance.notice.model.vo.Notice;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;

	@Override
	public ArrayList<Notice> selectAll() {
		return noticeDao.selectAll();
	}

	@Override
	public int selectListCount() {
		return noticeDao.selectListCount();
	}

	@Override
	public ArrayList<Notice> selectList(Paging page) {
		return noticeDao.selectList(page);
	}

	@Override
	public Notice selectNotice(int notice_no) {
		return noticeDao.selectNotice(notice_no);
	}

	@Override
	public int insertNotice(Notice notice) {
		return noticeDao.insertNotice(notice);
	}

	@Override
	public int updateNotice(Notice notice) {
		return noticeDao.updateNotice(notice);
	}

	@Override
	public int deleteNotice(int notice_no) {
		return noticeDao.deleteNotice(notice_no);
	}

	@Override
	public int selectWriterCount() {
		return noticeDao.selectWriterCount();
	}
	
	@Override
	public ArrayList<Notice> selectNewTop3() {
		return noticeDao.selectNewTop3();
	}

	@Override
	public int selectSearchTitle(String keyword) {
		return noticeDao.selectSearchTitle(keyword);
	}

	@Override
	public int selectSearchWriter(String keyword) {
		return noticeDao.selectSearchWriter(keyword);
	}

	@Override
	public int selectSearchDate(SearchDate date) {
		return noticeDao.selectSearchDate(date);
	}

	@Override
	public ArrayList<Notice> pageSearchTitle(Paging page) {
		return noticeDao.pageSearchTitle(page);
	}

	@Override
	public ArrayList<Notice> pageSearchWriter(Paging page) {
		return noticeDao.pageSearchWriter(page);
	}

	@Override
	public ArrayList<Notice> pageSearchDate(Paging page) {
		return noticeDao.pageSearchDate(page);
	}

	@Override
	public int updateAddReadcount(int notice_no) {
		return noticeDao.updateAddReadCount(notice_no);
	}

	
}
