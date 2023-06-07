

    <!--PLAYER SINGLE WRAP BEGIN-->

    <section class="player-single-wrap">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="captain-bage">경기 장소</div>
                    <h4 class="player-name">HOME STADIUM</h4>
                    <h3>${game.homeTeam.stadiumName}</h3>
                </div>
                <div class="col-md-6">
                    
					<div class="player-photo">
					    <div class="number">15</div>
					    <img class="img-responsive" src="${game.homeTeam.stadiumImageFile}" width="500" height="500" alt="player">
					</div>
                </div>
                <div class="col-md-6">
                    <div class="player-info">
                        <h6 class="player-info-title">경기 정보</h6>	
                        <div class="summary">
                            <div class="row">
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <div class="item">매 치 업:</div>
                                </div>
                                <div class="col-md-9 col-sm-9 col-xs-9">${game.homeTeam.teamNickName} vs ${game.awayTeam.teamNickName}</div>
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <div class="item">경기 날짜:</div>
                                </div>
                                <div class="col-md-9 col-sm-9 col-xs-9">${game.gameDate}</div>
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <div class="item">경기 시간:</div>
                                </div>
                                <div class="col-md-9 col-sm-9 col-xs-9">${game.gameTime}</div>
                            </div>
                        </div>
                        <h6>남은좌석/총좌석</h6>
                        <p>${salesTicket} / 60</p>
                    </div>
                   	 <button type="button" class="getSeats">경기 예매</button>
							<input type="hidden" name="gameCode" value="${game.gameCode}"/>
                </div>
                <div class="col-md-12">
                    <p>경기 예매 규정 안내글 ~~~~</p>
                </div>
            </div>
        </div>
    </section>

    <!--PLAYER SINGLE WRAP END-->
