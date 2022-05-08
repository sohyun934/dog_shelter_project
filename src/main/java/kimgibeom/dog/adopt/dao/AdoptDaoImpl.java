package kimgibeom.dog.adopt.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kimgibeom.dog.adopt.dao.map.AdoptMap;
import kimgibeom.dog.adopt.domain.Adopt;
import kimgibeom.dog.adopt.domain.AdoptPagination;
import kimgibeom.dog.adopt.domain.AdoptSearch;

@Repository
public class AdoptDaoImpl implements AdoptDao {
	@Autowired
	private AdoptMap adoptMap;

	@Override
	public String getUserPw(String userId) {
		return adoptMap.getUserPw(userId);
	}

	@Override
	public int addReservation(Adopt adopt) {
		return adoptMap.addReservation(adopt);
	}

	@Override
	public List<Adopt> getReservationUsersForDogNum(int dogNum) {
		return adoptMap.getReservationUsersForDogNum(dogNum);
	}

	@Override
	public List<Adopt> getReservationForUserId(String userId) {
		return adoptMap.getReservationForUserId(userId);
	}

	@Override
	public int getAdoptListCnt(AdoptSearch adoptSearch) {
		return adoptMap.getAdoptListCnt(adoptSearch);
	}

	@Override
	public List<Adopt> getAdopts(AdoptPagination adoptPagination) {
		return adoptMap.getAdopts(adoptPagination);
	}

	@Override
	public int restDelAdopt(int adoptNum, int dogNum) {
		return adoptMap.restDelAdopt(adoptNum, dogNum);
	}

	@Override
	public int completeAdopt(int adoptNum, int dogNum) {
		return adoptMap.completeAdopt(adoptNum, dogNum);
	}

	@Override
	public int delAdopt(int adoptNum) {
		return adoptMap.delAdopt(adoptNum);
	}
}