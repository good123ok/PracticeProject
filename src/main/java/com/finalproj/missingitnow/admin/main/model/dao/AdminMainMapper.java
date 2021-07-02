package com.finalproj.missingitnow.admin.main.model.dao;

public interface AdminMainMapper {

	// 일반회원
	int selectTotalUserCount();
	int selectTodayRegistUserCount();
	int selectUnpurchasedUserCount();
	int selectHighRateRefundUserCount();

	// 기업회원
	int selectTotalCorpUserCount();
	int selectUnacceptedCorpUserCount();
	int selectTodayRegistCorpUserCount();

	// Q&A
	int selectTotalQNACount();
	int selectTotalUserQuestionCount();
	int selectTotalCorpUserQuestionCount();
	int selectTotalNonAnswerUserQuestionCount();
	int selectTotalNonAnswerCorpUserQuestionCount();
	
	// 정산신청
	int selectTotalSettlementCount();
	int selectUnsettlementCount();
	int selectShortPeriodSettlementCount();
	int selectLargeAmountSettlementCount();
	int selectTodaySettlementCount();
	
	// 주문내역
	int selectTotalOrderCount();
	int selectLastMonthOrderCount();
	int selectRefundOrReturnOrderCount();
	int selectDeliveringOrderCount();
	int selectWaitingDepositOrderCount();
	
	// 수수료
	int selectTotalCommission();
	int selectLastMonthCommission();
	int selectLastWeekCommission();
	int selectLastDayCommission();

}
