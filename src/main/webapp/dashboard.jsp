<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="ax" uri="http://axis.com/axu4j"
%><ax:extends name="base">
	<ax:put block="title">대시보드</ax:put>
	<ax:put block="header" type="REPLACE">
		<h1>대시보드</h1>
		<p class="desc">웹 사이트의 전체적인 상황을 추척하고 보여줍니다.</p>
	</ax:put>
	<ax:put block="contents">
		<div class="ax-layer">
			<div class="ax-col-6">
				<div class="ax-unit">
					<div class="ax-box sample-01">
						<div class="ax-box-wrap">
							<h1>
								Inline 테이블
								<a href="#" class="more">more <i class="axi axi-external-link-square"></i></a>
							</h1>
							<p>
								테이블의 기본 형을 정의 합니다.<br />
							</p>
							<table cellpadding="0" cellspacing="0" class="AXGridTable">
								<colgroup>
									<col width="60" />
									<col />
									<col width="50" />
									<col />
									<col width="50" />
									<col />
								</colgroup>
								<thead>
								<tr>
									<td>
										<div class="tdRel">
											&nbsp;
										</div>
									</td>
									<td colspan="2">
										<div class="tdRel">
											발생건수
										</div>
									</td>
									<td colspan="2">
										<div class="tdRel">
											누계건수
										</div>
									</td>
									<td colspan="2">
										<div class="tdRel">
											전년대비(누계)
										</div>
									</td>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td>사고</td>
									<td>55건</td>
									<td>99</td>
									<td>1,022건</td>
									<td>0</td>
									<td>1,022건</td>
									<td>1</td>
								</tr>
								<tr>
									<td>사고</td>
									<td>55건</td>
									<td>99</td>
									<td>1,022건</td>
									<td>0</td>
									<td>1,022건</td>
									<td>1</td>
								</tr>
								<tr class="gray">
									<td>사고</td>
									<td>55건</td>
									<td>99</td>
									<td>1,022건</td>
									<td>0</td>
									<td>1,022건</td>
									<td>1</td>
								</tr>
								<tr class="red">
									<td>사고</td>
									<td>55건</td>
									<td>99</td>
									<td>1,022건</td>
									<td>0</td>
									<td>1,022건</td>
									<td>1</td>
								</tr>
								<tr class="green">
									<td>사고</td>
									<td>55건</td>
									<td>99</td>
									<td>1,022건</td>
									<td>0</td>
									<td>1,022건</td>
									<td>1</td>
								</tr>
								<tr class="blue">
									<td>사고</td>
									<td>55건</td>
									<td>99</td>
									<td>1,022건</td>
									<td>0</td>
									<td>1,022건</td>
									<td>1</td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="ax-clear"></div>
					<div class="H20"></div>
				</div>
			</div>
			<div class="ax-col-6">
				<div class="ax-unit">
					<div class="ax-box">
						<div class="ax-box-wrap">
							<h1>
								AXGrid 출력
								<a href="#" class="more">more <i class="axi axi-external-link-square"></i></a>
							</h1>
							<p>그리드를 이용한 목록 출력</p>
							<div id="page-grid-box"></div>
						</div>
					</div>
					<div class="ax-clear"></div>
					<div class="H20"></div>
				</div>
			</div>
			<div class="ax-clear"></div>
		</div>

		<div class="ax-layer">
			<div class="ax-col-6">
				<div class="ax-unit">
					<div class="ax-box">
						<div class="ax-box-wrap">
							<h1>
								Chart Doughnut
								<a href="#" class="more">more <i class="axi axi-external-link-square"></i></a>
							</h1>
							<p>Chart.js를 이용한 차트 Canvas태그를 사용가능해야 합니다.</p>
							<canvas id="chart-canvas-doughnut" height="200" style="min-height: 256px;"></canvas>
						</div>
					</div>
					<div class="ax-clear"></div>
					<div class="H20"></div>
				</div>
			</div>
			<div class="ax-col-6">
				<div class="ax-unit">
					<div class="ax-box">
						<div class="ax-box-wrap">
							<h1>
								Chart Line
								<a href="#" class="more">more <i class="axi axi-external-link-square"></i></a>
							</h1>
							<p>Chart.js를 이용한 차트 Canvas태그를 사용가능해야 합니다.</p>
							<canvas id="chart-canvas-line" height="200" style="min-height: 256px;"></canvas>
						</div>
					</div>
					<div class="ax-clear"></div>
					<div class="H20"></div>
				</div>
			</div>
			<div class="ax-clear"></div>
		</div>
	</ax:put>
	<ax:put block="scripts">
		<script type="text/javascript">
		    var doughnutData = [
		        {
		            value: 300,
		            color:"#F7464A",
		            highlight: "#FF5A5E",
		            label: "Red"
		        },
		        {
		            value: 50,
		            color: "#46BFBD",
		            highlight: "#5AD3D1",
		            label: "Green"
		        },
		        {
		            value: 100,
		            color: "#FDB45C",
		            highlight: "#FFC870",
		            label: "Yellow"
		        },
		        {
		            value: 40,
		            color: "#949FB1",
		            highlight: "#A8B3C5",
		            label: "Grey"
		        },
		        {
		            value: 120,
		            color: "#4D5360",
		            highlight: "#616774",
		            label: "Dark Grey"
		        }
		    ];
		
		    var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
		    var lineChartData = {
		        labels : ["January","February","March","April","May","June","July"],
		        datasets : [
		            {
		                label: "My First dataset",
		                fillColor : "rgba(220,220,220,0.2)",
		                strokeColor : "rgba(220,220,220,1)",
		                pointColor : "rgba(220,220,220,1)",
		                pointStrokeColor : "#fff",
		                pointHighlightFill : "#fff",
		                pointHighlightStroke : "rgba(220,220,220,1)",
		                data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
		            },
		            {
		                label: "My Second dataset",
		                fillColor : "rgba(151,187,205,0.2)",
		                strokeColor : "rgba(151,187,205,1)",
		                pointColor : "rgba(151,187,205,1)",
		                pointStrokeColor : "#fff",
		                pointHighlightFill : "#fff",
		                pointHighlightStroke : "rgba(151,187,205,1)",
		                data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
		            }
		        ]
		
		    };
		
		
		var fnObj = {
		    pageStart: function(){
		        this.grid.bind();
		        this.chart.Doughnut();
		        this.chart.Line();
		    },
		    grid: {
		        target: new AXGrid(),
		        get: function(){ return this.target },
		        bind: function(){
		
		            this.target.setConfig({
		                targetID : "page-grid-box",
		                theme : "AXGrid",
		                height: 218,
		                mediaQuery: {
		                    mx:{min:0, max:767}, dx:{min:767}
		                },
		                colGroup : [
		                    {key:"no", label:"번호", width:"40", align:"center", formatter:"money"},
		                    {key:"title", label:"제목", width:"200"},
		                    {key:"writer", label:"작성자", width:"90", align:"center"},
		                    {key:"regDate", label:"작성일", width:"90", align:"center"},
		                    {key:"desc", label:"비고", width:"*"}
		                ],
		                view: {
		                    label:true,
		                    column: [ // col 은 4
		                        {key:"title", label:"제목", col:4, addClass:"underLine"},
		                        {key:"no", label:"번호", col:1},
		                        {key:"desc", label:"비고", col:3},
		                        {key:"writer", label:"작성자"},
		                        {key:"regDate", label:"작성일"},
		                        {key:"", label:"사용자연산", formatter: function(){
		                            return (this.item.no * 987).money();
		                        }}
		                    ],
		                    buttons: [
		                        {addClass:"handle", onclick:function(){
		                            toast.push("handle Click");
		                            trace(this.item);
		                        }}
		                    ]
		                },
		                body : {
		                    onclick: function(){
		                        //toast.push(Object.toJSON({index:this.index, item:this.item}));
		                        //alert(this.list);
		                        //alert(this.page);
		                        fnObj.modal.open("gridView", this.item);
		                    }
		                },
		                page:{
		                    paging:true,
		                    pageNo:1,
		                    pageSize:100,
		                    status:{formatter: null}
		                }
		            });
		
		            this.target.setList({
		                ajaxUrl:"<c:url value='/data/list.json' />", ajaxPars:"param1=1&param2=2", onLoad:function(){
		                    //trace(this);
		                }
		            });
		        }
		    },
		    chart:{
		        Doughnut: function(){
		            var chart_doughnut = document.getElementById("chart-canvas-doughnut").getContext("2d");
		            window.myChart_doughnut = new Chart(chart_doughnut).Doughnut(doughnutData, {
		                responsive : true
		            });
		        },
		        Line: function(){
		            var chart_line = document.getElementById("chart-canvas-line").getContext("2d");
		            window.myChart_line = new Chart(chart_line).Line(lineChartData, {
		                responsive : true
		            });
		        }
		    }
		}
		</script>
	</ax:put>
</ax:extends>