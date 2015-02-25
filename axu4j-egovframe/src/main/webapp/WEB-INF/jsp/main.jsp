<%@ page import="java.util.*"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="ax" uri="http://axisj.com/axu4j"
%><%

%><ax:layout name="base.jsp">
    <ax:set name="title" value="메인페이지" />
    <ax:div name="css">
        <style type="text/css">
            .legend-container {
                position: absolute;
                right: 10px;
                top: 30px;
                margin: 0px;
                padding: 0px;
            }
            .legend-container li {
                margin: 5px;
                list-style: none;
            }
            .legend-container li .legend {
                display: inline-block;
                width: 12px;
                height: 12px;
                vertical-align: middle;
            }
            .today-summay-table dl {
                display: block;
                float: left;
                width: 50%;
                padding: 10px 0px;
                margin: 0px;
                font-size: 13px;
                border-bottom: 1px dashed #eee;
            }
            .today-summay-table dl dt {
                color: #888;
                text-align: left;
                display: inline-block;
                float: left;
                margin-right: 10px;
                min-width: 120px;
                font-weight: bold;
            }
            .today-summay-table dl dd {
                color: #468ec8;
                margin: 0px;
                text-align: center;
                font-size: 14px;
                display: inline-block;
            }
            .today-summay-table dl dd .red {
                color: #c83229;
            }
            .today-summay-table dl dd .green {
                color: #6fc861;
            }
            .month-summay-table dl {
                display: block;
                float: left;
                width: 100%;
                padding: 10px 0px;
                margin: 0px;
                font-size: 13px;
                border-bottom: 1px dashed #eee;
            }
            .month-summay-table dl dt {
                color: #888;
                text-align: left;
                display: inline-block;
                float: left;
                margin-right: 10px;
                min-width: 150px;
                font-weight: bold;
            }
            .month-summay-table dl dd {
                color: #468ec8;
                margin: 0px;
                text-align: center;
                font-size: 14px;
                display: inline-block;
            }
            .month-summay-table dl dd .red {
                color: #c83229;
            }
            .month-summay-table dl dd .green {
                color: #6fc861;
            }
        </style>
    </ax:div>
	<ax:div name="header">
		<h1>대시보드</h1>
		<p class="desc">메인페이지</p>
	</ax:div>
	<ax:div name="contents">
		<ax:row>
			<ax:col size="6" id="trace-target">

                <h1>
                    Today 상태
                    <a href="#" class="more">Daily Reporting <i class="axi axi-external-link-square"></i></a>
                </h1>
                <p>기간 : AM 09:00 ~ PM 02:00</p>

                <ul class="legend-container">
                    <li><span class="legend" style="background: #417dd6;"></span> 진행중</li>
                    <li><span class="legend" style="background: #ffa941;"></span> 대기중</li>
                    <li><span class="legend" style="background: #00ba63;"></span> 완료</li>
                </ul>
                <canvas id="chart-canvas-doughnut" height="150" style=""></canvas>

                <div class="AXHspace10"></div>
                <div class="today-summay-table" id="today-summay-table">

                </div>

			</ax:col>
            <ax:col size="6">

                <h1>
                    대기 목록
                    <a href="#" class="more">more <i class="axi axi-external-link-square"></i></a>
                </h1>
                <div id="page-grid-box"></div>

            </ax:col>
		</ax:row>
        <ax:row>
            <ax:col size="12">
                <h1>
                    주간 현황
                    <a href="#" class="more">Monthly Reporting <i class="axi axi-external-link-square"></i></a>
                </h1>

                <div class="ax-layer">
                    <div class="ax-col-6">
                        <div class="ax-unit">
                            <div class="month-summay-table" id="month-summay-table">

                            </div>
                        </div>
                    </div>
                    <div class="ax-col-6">
                        <div class="ax-unit">
                            <h3>완료 건수</h3>
                            <canvas id="chart-canvas-line-0" height="100" style=""></canvas>
                        </div>
                    </div>
                    <div class="ax-clear"></div>
                </div>
                <div class="ax-layer">
                    <div class="ax-col-6">
                        <div class="ax-unit">
                            <h3>평균 완료시간</h3>
                            <canvas id="chart-canvas-line-1" height="100" style=""></canvas>
                        </div>
                    </div>
                    <div class="ax-col-6">
                        <div class="ax-unit">
                            <h3>평균처리 건수</h3>
                            <canvas id="chart-canvas-line-2" height="100" style=""></canvas>
                        </div>
                    </div>
                    <div class="ax-clear"></div>
                </div>
            </ax:col>
        </ax:row>
	</ax:div>
	<ax:div name="scripts">
		<script type="text/javascript">
            var page_menu_id = "m0101";

            var fnObj = {
                pageStart: function(){

                    this.grid.bind();
                    this.today_summary();
                    this.month_summary();

                },
                pageResize: function(){
                    if(fnObj.resizeTimer) clearTimeout(fnObj.resizeTimer);
                    fnObj.resizeTimer = setTimeout(function(){
                        fnObj.grid.trace_height();
                    }, 300);
                },
                today_summary: function(){

                    var chart_data = [];
                    chart_data.push({
                        value    : 20,
                        color    : "#417dd6",
                        highlight: "#417dd6",
                        label    : "상담 진행중"
                    });
                    chart_data.push({
                        value    : 15,
                        color    : "#ffa941",
                        highlight: "#ffa941",
                        label    : "상담 대기중"
                    });
                    chart_data.push({
                        value    : 255,
                        color    : "#00ba63",
                        highlight: "#00ba63",
                        label    : "상담완료"
                    });
                    fnObj.chart.Doughnut(chart_data);

                    var po = [];

                    po.push('<dl>');
                    po.push('	<dt>전체 건수</dt>');
                    po.push('   <dd>290건 <i class="axi axi-ion-arrow-graph-up-right red"></i></dd>');
                    po.push('</dl>');
                    po.push('<dl>');
                    po.push('	<dt>완료 건수</dt>');
                    po.push('   <dd>255건</dd>');
                    po.push('</dl>');
                    po.push('<dl>');
                    po.push('	<dt>평균 완료 시간</dt>');
                    po.push('   <dd>12.5h <i class="axi axi-ion-arrow-graph-down-right green"></i></dd>');
                    po.push('</dl>');
                    po.push('<dl>');
                    po.push('	<dt>평균 처리건수</dt>');
                    po.push('   <dd>12건 <i class="axi axi-ion-arrow-graph-up-right red"></i></dd>');
                    po.push('</dl>');
                    po.push('<dl>');
                    po.push('	<dt>대기 건수</dt>');
                    po.push('   <dd>15건 <i class="axi axi-ion-arrow-graph-up-right red"></i></dd>');
                    po.push('</dl>');
                    po.push('<div class="clear"></div>');

                    $("#today-summay-table").html( po.join('') );

                },
                month_summary: function(){
                    //

                    if("차트0") {
                        var chart_data_0 = {
                            labels  : ["01-01",'01-02','01-03','01-04','01-05','01-06'],
                            datasets: [
                                {
                                    label               : "상담완료 건수",
                                    fillColor           : "rgba(12,189,106,0.2)",
                                    strokeColor         : "rgba(12,189,106,1)",
                                    pointColor          : "rgba(12,189,106,1)",
                                    pointStrokeColor    : "#fff",
                                    pointHighlightFill  : "#fff",
                                    pointHighlightStroke: "rgba(220,220,220,1)",
                                    data                : [12,11,7,10,11,9]
                                }
                            ]
                        };
                        fnObj.chart.Line(chart_data_0);
                    }
                    if("차트1") {
                        var chart_data_1 = {
                            labels  : ["01-01",'01-02','01-03','01-04','01-05','01-06'],
                            datasets: [
                                {
                                    label               : "평균상담 완료시간",
                                    fillColor           : "rgba(255,38,0,0.2)",
                                    strokeColor         : "rgba(255,38,0,1)",
                                    pointColor          : "rgba(255,38,0,1)",
                                    pointStrokeColor    : "#fff",
                                    pointHighlightFill  : "#fff",
                                    pointHighlightStroke: "rgba(220,220,220,1)",
                                    data                : [12,11,7,10,11,9]
                                }
                            ]
                        };
                        fnObj.chart.Line1(chart_data_1);
                    }
                    if("차트2") {
                        var chart_data_2 = {
                            labels  : ["01-01",'01-02','01-03','01-04','01-05','01-06'],
                            datasets: [
                                {
                                    label               : "상담원당 평균처리 건수",
                                    fillColor           : "rgba(75,117,255,0.2)",
                                    strokeColor         : "rgba(75,117,255,1)",
                                    pointColor          : "rgba(75,117,255,1)",
                                    pointStrokeColor    : "#fff",
                                    pointHighlightFill  : "#fff",
                                    pointHighlightStroke: "rgba(220,220,220,1)",
                                    data                : [12,11,7,10,11,9]
                                }
                            ]
                        };
                        fnObj.chart.Line2(chart_data_2);
                    }

                    var po = [];

                    po.push('<dl>');
                    po.push('	<dt>전체 상담완료 건수</dt>');
                    po.push('   <dd>456건 <i class="axi axi-ion-arrow-graph-up-right red"></i></dd>');
                    po.push('</dl>');
                    po.push('<dl>');
                    po.push('	<dt>평균 상담완료 시간</dt>');
                    po.push('   <dd>1.2h <i class="axi axi-ion-arrow-graph-down-right green"></i></dd>');
                    po.push('</dl>');
                    po.push('<dl>');
                    po.push('	<dt>상담원당 평균 처리건수</dt>');
                    po.push('   <dd>12건 <i class="axi axi-ion-arrow-graph-up-right red"></i></dd>');
                    po.push('</dl>');
                    po.push('<div class="clear"></div>');

                    $("#month-summay-table").html( po.join('') );
                },
                grid: {
                    target: new AXGrid(),
                    get: function(){ return this.target },
                    bind: function(){

                        this.target.setConfig({
                            targetID : "page-grid-box",
                            theme : "AXGrid",
                            /*
                            mediaQuery: {
                                mx:{min:0, max:767}, dx:{min:767}
                            },
                            */
                            colGroup : [
                                //{key:"no", label:"번호", width:"40", align:"center", formatter:"money"},
                                {key:"nickname", label:"상담원", width:"*"},
                                {key:"end_count", label:"상담완료건수", width:"100", align:"center"},
                                {key:"receipt", label:"평균 상담완료시간", width:"120", align:"center"},
                                {key:"ing", label:"상담 대기 건수", width:"100", align:"center"}
                            ],
                            body : {
                                onclick: function(){
                                    //toast.push(Object.toJSON({index:this.index, item:this.item}));
                                    //alert(this.list);
                                    //alert(this.page);
                                    //fnObj.modal.open("gridView", this.item);
                                }
                            },
                            page:{
                                paging:false,
                                pageNo:1,
                                pageSize:100,
                                status:{formatter: null}
                            }
                        });

                    },
                    trace_height: function(){
                        $('#page-grid-box').css({height: $("#trace-target").height()-96 });
                        this.target.resetHeight();
                    }
                },
                chart:{
                    Doughnut: function(chart_data){
                        var chart_doughnut = document.getElementById("chart-canvas-doughnut").getContext("2d");
                        window.myChart_doughnut = new Chart(chart_doughnut).Doughnut(chart_data, {
                            responsive : true
                        });
                        fnObj.pageResize();
                    },
                    Line: function(lineChartData){
                        var chart_line = document.getElementById("chart-canvas-line-0").getContext("2d");
                        window.myChart_line = new Chart(chart_line).Line(lineChartData, {
                            responsive : true
                        });
                    },
                    Line1: function(lineChartData){
                        var chart_line = document.getElementById("chart-canvas-line-1").getContext("2d");
                        window.myChart_line = new Chart(chart_line).Line(lineChartData, {
                            responsive : true
                        });
                    },
                    Line2: function(lineChartData){
                        var chart_line = document.getElementById("chart-canvas-line-2").getContext("2d");
                        window.myChart_line = new Chart(chart_line).Line(lineChartData, {
                            responsive : true
                        });
                    }
                }
            };
            jQuery(window).resize(function() {
                fnObj.pageResize()
            });
		</script>
	</ax:div>
</ax:layout>