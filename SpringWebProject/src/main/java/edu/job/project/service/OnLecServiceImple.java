package edu.job.project.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.job.project.domain.GroupOn;
import edu.job.project.domain.Member;
import edu.job.project.domain.OnLec;
import edu.job.project.prisitence.MemberDao;
import edu.job.project.prisitence.OnLecDao;


@Service
public class OnLecServiceImple implements OnLecService {
	
	@Autowired
	private OnLecDao dao;
	
	@Autowired
	private MemberDao mDao;
	
	@Override
	public List<OnLec> read(String userId) {
		
		return dao.selectAll(userId);
	}

	@Override
	public List<GroupOn> readGroup(String userId) {

		return dao.selectAllGroup(userId);
	}

	@Override
	public int createGroup(GroupOn on) {
		
		return dao.insertGorup(on);
	}
	
	@Override
	public GroupOn readGroup(GroupOn on) {
		return dao.selectGroup(on);
	}

	@Override
	public List<OnLec> read(int bno) {
		
		return dao.selectBno(bno);
	}

	@Override
	public int create(OnLec on) {
		
		return dao.insertOnLec(on);
	}

	@Override
	public int updateGroupImage(OnLec on) {
		
		return dao.updateGroupImage(on);
	}

	@Override
	public List<OnLec> readByGroupBno(int groupBno) {
		
		return dao.selectGroupBnoByOnLec(groupBno);
	}

	@Override
	public OnLec readByBno(int bno) {
		// 
		return dao.selectBnoByOnLec(bno);
	}

	@Override
	public String like(OnLec on) {
		System.out.println(on.getUserId());
		Member m = mDao.getId(on.getUserId());
		System.out.println("들어옴");
		String realResult = null;
		StringBuffer b = new StringBuffer();
		if(m.getOnLec() != null) {
			
			List<String> items = new ArrayList<>(Arrays.asList(m.getOnLec().split("\\s*,\\s*")));
			
			if(items.indexOf(String.valueOf(on.getGroupBno())) == -1) {	
				b.append(m.getOnLec()).append(",").append(on.getGroupBno());
				m.setOnLec(b.toString());
				System.out.println("들어옴1");
				int result = mDao.updateOnlec(m);
				if(result == 1) {
					realResult =  "ok";
				}
			}else {
				System.out.println("들어옴2");
				realResult =  "no";
			}
			
		}else {
			System.out.println("들어옴3");
			String onLec = String.valueOf(on.getGroupBno());
			m.setOnLec(onLec);
			int result = mDao.updateOnlec(m);
			if(result == 1) {
				realResult =  "ok";
			}
		}
		return realResult;
	}

	@Override
	public int likeUp(int Bno) {
		
		return dao.updateLike(Bno);
	}

	

}
