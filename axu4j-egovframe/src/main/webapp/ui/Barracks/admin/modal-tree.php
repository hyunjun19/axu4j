<!DOCTYPE html>
<html>
<head>
    <!-- META -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1" />
    <!-- TITLE -->
    <title>Barracks</title>

    <link rel="shortcut icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon" />
    <link rel="icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="http://dev.axisj.com/ui/AXJ.png" />
    <link rel="apple-touch-icon-precomposed" href="http://dev.axisj.com/ui/AXJ.png" />
    <meta property="og:image" content="http://dev.axisj.com/samples/_img/axisj_sns.png" />
    <meta property="og:site_name" content="Axis of Javascript - axisj.com" />
    <meta property="og:description" id="meta_description" content="Javascript UI Library based on JQuery" />

    <link rel="stylesheet" type="text/css" href="http://cdn.axisj.com/axicon/axicon.min.css" />
    <link rel="stylesheet" type="text/css" href="http://dev.axisj.com/ui/cocker/AXJ.min.css" />

    <link rel="stylesheet" href="ui/cocker/admin.css" />

    <script type="text/javascript" src="http://dev.axisj.com/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="http://dev.axisj.com/dist/AXJ.min.js"></script>

	<script type="text/javascript">
	var fnObj = {
		pageStart: function(){
            fnObj.tree.init();
		},
        pageResize: function(){
            parent.myModal.resize();
        },
        tree: {
            target: new AXTree(),
            init: function(){
                fnObj.tree.target.setConfig({
                    targetID : "menu-navigator",
                    theme: "AXTree_none",
                    emptyListMSG:"<i class='axi axi-spinner axi-spin'></i> Loading..",
                    iconWidth:18,
                    indentRatio:0.75,
                    relation: {
                        parentKey: "pno",
                        childKey: "no"
                    },
                    reserveKeys:{
                        parentHashKey:"pHash", // 부모 트리 포지션
                        hashKey:"hash", // 트리 포지션
                        openKey:"open", // 확장여부
                        subTree:"subTree", // 자식개체키
                        displayKey:"display" // 표시여부
                    },
                    colGroup: [
                        {
                            key:"name",
                            label:"name",
                            width:"*", align:"left",
                            indent:true,
                            getIconClass: function(){
                                if(this.item.type == "Folder"){
                                    return {
                                        addClass:"userHtml",
                                        html:"<i class='axi axi-folder-open'></i>"
                                    };
                                }else{
                                    if(this.item.extension.search(/jpg|jpeg|png|gif|bmg|apng/gi) > -1){
                                        return {
                                            addClass:"userHtml",
                                            html:"<i class='axi axi-file-image-o'></i>"
                                        };
                                    }else if(this.item.extension.search(/html|htm|asp|json|js/gi) > -1){
                                        return {
                                            addClass:"userHtml",
                                            html:"<i class='axi axi-file-code-o'></i>"
                                        };
                                    }else{
                                        return {
                                            addClass:"userHtml",
                                            html:"<i class='axi axi-file-o'></i>"
                                        };
                                    }
                                }
                            },
                            formatter:function(){
                                return this.item.name;
                            }
                        }
                    ],
                    body: {
                        onclick:function(){
                            if(this.item.type == "Folder") {
                                fnObj.tree.target.expandToggleList(this.index, this.item);
                            }
                        },
                        ondblclick:function(){
                            if(this.item.extension.search(/html|htm|asp/gi) > -1){
                                fnObj.submit();
                            }else{
                                toast.push( this.item.name );
                            }
                        }
                    }
                });
                fnObj.tree.setTree();
            },
            setTree: function(){

                var tree = [{"pno":0, "no":1, "fullPath":"data", "name":"data", "type":"Folder", "extension":"", "subTree":[{"pno":1, "no":1, "fullPath":"data%5Cg_curriculum.asp", "name":"g_curriculum.asp", "type":"File", "extension":"asp"}, {"pno":1, "no":2, "fullPath":"data%5Cg_curriculum_e.asp", "name":"g_curriculum_e.asp", "type":"File", "extension":"asp"}, {"pno":1, "no":3, "fullPath":"data%5Cprofessors.asp", "name":"professors.asp", "type":"File", "extension":"asp"}, {"pno":1, "no":4, "fullPath":"data%5Cprofessors_e.asp", "name":"professors_e.asp", "type":"File", "extension":"asp"}, {"pno":1, "no":5, "fullPath":"data%5Cu_curriculum.asp", "name":"u_curriculum.asp", "type":"File", "extension":"asp"}, {"pno":1, "no":6, "fullPath":"data%5Cu_curriculum_e.asp", "name":"u_curriculum_e.asp", "type":"File", "extension":"asp"}]}, {"pno":0, "no":8, "fullPath":"en", "name":"en", "type":"Folder", "extension":"", "subTree":[{"pno":8, "no":9, "fullPath":"en%5Clayouts", "name":"layouts", "type":"Folder", "extension":"", "subTree":[{"pno":9, "no":10, "fullPath":"en%5Clayouts%5Cjs", "name":"js", "type":"Folder", "extension":"", "subTree":[{"pno":10, "no":10, "fullPath":"en%5Clayouts%5Cjs%5Cless-1.7.1.min.js", "name":"less-1.7.1.min.js", "type":"File", "extension":"js"}]}, {"pno":9, "no":12, "fullPath":"en%5Clayouts%5Cmain", "name":"main", "type":"Folder", "extension":"", "subTree":[{"pno":12, "no":12, "fullPath":"en%5Clayouts%5Cmain%5Clayout-end.asp", "name":"layout-end.asp", "type":"File", "extension":"asp"}, {"pno":12, "no":13, "fullPath":"en%5Clayouts%5Cmain%5Clayout-start.asp", "name":"layout-start.asp", "type":"File", "extension":"asp"}]}, {"pno":9, "no":15, "fullPath":"en%5Clayouts%5Cmodules", "name":"modules", "type":"Folder", "extension":"", "subTree":[{"pno":15, "no":15, "fullPath":"en%5Clayouts%5Cmodules%5Ccommunity-module.asp", "name":"community-module.asp", "type":"File", "extension":"asp"}, {"pno":15, "no":16, "fullPath":"en%5Clayouts%5Cmodules%5Cgallery-module.asp", "name":"gallery-module.asp", "type":"File", "extension":"asp"}, {"pno":15, "no":17, "fullPath":"en%5Clayouts%5Cmodules%5Cqna-module.asp", "name":"qna-module.asp", "type":"File", "extension":"asp"}]}, {"pno":9, "no":19, "fullPath":"en%5Clayouts%5Csub", "name":"sub", "type":"Folder", "extension":"", "subTree":[{"pno":19, "no":19, "fullPath":"en%5Clayouts%5Csub%5Clayout-end.asp", "name":"layout-end.asp", "type":"File", "extension":"asp"}, {"pno":19, "no":20, "fullPath":"en%5Clayouts%5Csub%5Clayout-start.asp", "name":"layout-start.asp", "type":"File", "extension":"asp"}]}, {"pno":9, "no":21, "fullPath":"en%5Clayouts%5Clayout-head.asp", "name":"layout-head.asp", "type":"File", "extension":"asp"}, {"pno":9, "no":22, "fullPath":"en%5Clayouts%5Clayout-page-foot.asp", "name":"layout-page-foot.asp", "type":"File", "extension":"asp"}, {"pno":9, "no":23, "fullPath":"en%5Clayouts%5Clayout-page-head.asp", "name":"layout-page-head.asp", "type":"File", "extension":"asp"}]}, {"pno":8, "no":24, "fullPath":"en%5Ccommunity.asp", "name":"community.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":25, "fullPath":"en%5Ccommunity_list.asp", "name":"community_list.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":26, "fullPath":"en%5Ccontacts.asp", "name":"contacts.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":27, "fullPath":"en%5Ccurriculum.asp", "name":"curriculum.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":28, "fullPath":"en%5Cgallery.asp", "name":"gallery.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":29, "fullPath":"en%5Cgallery_list.asp", "name":"gallery_list.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":30, "fullPath":"en%5Cgraduate_curriculum.asp", "name":"graduate_curriculum.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":31, "fullPath":"en%5Cgraduate_overview.asp", "name":"graduate_overview.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":32, "fullPath":"en%5Cgreeting.asp", "name":"greeting.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":33, "fullPath":"en%5Cg_1.asp", "name":"g_1.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":34, "fullPath":"en%5Cg_2.asp", "name":"g_2.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":35, "fullPath":"en%5Cg_3.asp", "name":"g_3.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":36, "fullPath":"en%5Cg_4.asp", "name":"g_4.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":37, "fullPath":"en%5Cg_5.asp", "name":"g_5.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":38, "fullPath":"en%5Cg_curriculum.asp", "name":"g_curriculum.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":39, "fullPath":"en%5Chistory.asp", "name":"history.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":40, "fullPath":"en%5Cmain.asp", "name":"main.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":41, "fullPath":"en%5Cnotice_list.asp", "name":"notice_list.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":42, "fullPath":"en%5Coffice.asp", "name":"office.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":43, "fullPath":"en%5Corganization.asp", "name":"organization.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":44, "fullPath":"en%5Coverview.asp", "name":"overview.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":45, "fullPath":"en%5Cprofessors.asp", "name":"professors.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":46, "fullPath":"en%5Cqna_list.asp", "name":"qna_list.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":47, "fullPath":"en%5Csub.asp", "name":"sub.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":48, "fullPath":"en%5Cundergraduate.asp", "name":"undergraduate.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":49, "fullPath":"en%5Cu_1.asp", "name":"u_1.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":50, "fullPath":"en%5Cu_1_2.asp", "name":"u_1_2.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":51, "fullPath":"en%5Cu_2.asp", "name":"u_2.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":52, "fullPath":"en%5Cu_3.asp", "name":"u_3.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":53, "fullPath":"en%5Cu_4.asp", "name":"u_4.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":54, "fullPath":"en%5Cu_5.asp", "name":"u_5.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":55, "fullPath":"en%5Cu_curriculum.asp", "name":"u_curriculum.asp", "type":"File", "extension":"asp"}, {"pno":8, "no":56, "fullPath":"en%5Cvision.asp", "name":"vision.asp", "type":"File", "extension":"asp"}]}, {"pno":0, "no":58, "fullPath":"ko", "name":"ko", "type":"Folder", "extension":"", "subTree":[{"pno":58, "no":59, "fullPath":"ko%5Clayouts", "name":"layouts", "type":"Folder", "extension":"", "subTree":[{"pno":59, "no":60, "fullPath":"ko%5Clayouts%5Cjs", "name":"js", "type":"Folder", "extension":"", "subTree":[{"pno":60, "no":60, "fullPath":"ko%5Clayouts%5Cjs%5Cless-1.7.1.min.js", "name":"less-1.7.1.min.js", "type":"File", "extension":"js"}]}, {"pno":59, "no":62, "fullPath":"ko%5Clayouts%5Cmain", "name":"main", "type":"Folder", "extension":"", "subTree":[{"pno":62, "no":62, "fullPath":"ko%5Clayouts%5Cmain%5Clayout-end.asp", "name":"layout-end.asp", "type":"File", "extension":"asp"}, {"pno":62, "no":63, "fullPath":"ko%5Clayouts%5Cmain%5Clayout-start.asp", "name":"layout-start.asp", "type":"File", "extension":"asp"}]}, {"pno":59, "no":65, "fullPath":"ko%5Clayouts%5Cmodules", "name":"modules", "type":"Folder", "extension":"", "subTree":[{"pno":65, "no":65, "fullPath":"ko%5Clayouts%5Cmodules%5Cboard-post.asp", "name":"board-post.asp", "type":"File", "extension":"asp"}, {"pno":65, "no":66, "fullPath":"ko%5Clayouts%5Cmodules%5Ccommunity-module.asp", "name":"community-module.asp", "type":"File", "extension":"asp"}, {"pno":65, "no":67, "fullPath":"ko%5Clayouts%5Cmodules%5Cgallery-module.asp", "name":"gallery-module.asp", "type":"File", "extension":"asp"}, {"pno":65, "no":68, "fullPath":"ko%5Clayouts%5Cmodules%5Cnotice-module-joined.asp", "name":"notice-module-joined.asp", "type":"File", "extension":"asp"}, {"pno":65, "no":69, "fullPath":"ko%5Clayouts%5Cmodules%5Cnotice-module.asp", "name":"notice-module.asp", "type":"File", "extension":"asp"}, {"pno":65, "no":70, "fullPath":"ko%5Clayouts%5Cmodules%5Cqna-module.asp", "name":"qna-module.asp", "type":"File", "extension":"asp"}]}, {"pno":59, "no":72, "fullPath":"ko%5Clayouts%5Csub", "name":"sub", "type":"Folder", "extension":"", "subTree":[{"pno":72, "no":72, "fullPath":"ko%5Clayouts%5Csub%5Clayout-end.asp", "name":"layout-end.asp", "type":"File", "extension":"asp"}, {"pno":72, "no":73, "fullPath":"ko%5Clayouts%5Csub%5Clayout-start.asp", "name":"layout-start.asp", "type":"File", "extension":"asp"}]}, {"pno":59, "no":74, "fullPath":"ko%5Clayouts%5Clayout-head.asp", "name":"layout-head.asp", "type":"File", "extension":"asp"}, {"pno":59, "no":75, "fullPath":"ko%5Clayouts%5Clayout-page-foot.asp", "name":"layout-page-foot.asp", "type":"File", "extension":"asp"}, {"pno":59, "no":76, "fullPath":"ko%5Clayouts%5Clayout-page-head.asp", "name":"layout-page-head.asp", "type":"File", "extension":"asp"}]}, {"pno":58, "no":77, "fullPath":"ko%5Ca_graduate.asp", "name":"a_graduate.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":78, "fullPath":"ko%5Ca_undergraduate.asp", "name":"a_undergraduate.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":79, "fullPath":"ko%5Ccommunity_list.asp", "name":"community_list.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":80, "fullPath":"ko%5Ccontacts.asp", "name":"contacts.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":81, "fullPath":"ko%5Ccurrent.asp", "name":"current.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":82, "fullPath":"ko%5Cgallery_list.asp", "name":"gallery_list.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":83, "fullPath":"ko%5Cgoal.asp", "name":"goal.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":84, "fullPath":"ko%5Cgreeting.asp", "name":"greeting.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":85, "fullPath":"ko%5Cg_1.asp", "name":"g_1.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":86, "fullPath":"ko%5Cg_2.asp", "name":"g_2.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":87, "fullPath":"ko%5Cg_3.asp", "name":"g_3.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":88, "fullPath":"ko%5Cg_4.asp", "name":"g_4.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":89, "fullPath":"ko%5Cg_5.asp", "name":"g_5.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":90, "fullPath":"ko%5Cg_curriculum.asp", "name":"g_curriculum.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":91, "fullPath":"ko%5Cg_intro.asp", "name":"g_intro.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":92, "fullPath":"ko%5Chistory.asp", "name":"history.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":93, "fullPath":"ko%5Cintro.asp", "name":"intro.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":94, "fullPath":"ko%5Cmain.asp", "name":"main.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":95, "fullPath":"ko%5Cmain_bk.asp", "name":"main_bk.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":96, "fullPath":"ko%5Cnotice_list.asp", "name":"notice_list.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":97, "fullPath":"ko%5Cnotice_list2.asp", "name":"notice_list2.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":98, "fullPath":"ko%5Coffice.asp", "name":"office.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":99, "fullPath":"ko%5Cprofessors.asp", "name":"professors.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":100, "fullPath":"ko%5Cqna_list.asp", "name":"qna_list.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":101, "fullPath":"ko%5Cschedule.asp", "name":"schedule.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":102, "fullPath":"ko%5Cstructure.asp", "name":"structure.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":103, "fullPath":"ko%5Csub.asp", "name":"sub.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":104, "fullPath":"ko%5Cu_1.asp", "name":"u_1.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":105, "fullPath":"ko%5Cu_1_2.asp", "name":"u_1_2.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":106, "fullPath":"ko%5Cu_2.asp", "name":"u_2.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":107, "fullPath":"ko%5Cu_3.asp", "name":"u_3.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":108, "fullPath":"ko%5Cu_4.asp", "name":"u_4.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":109, "fullPath":"ko%5Cu_5.asp", "name":"u_5.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":110, "fullPath":"ko%5Cu_curriculum.asp", "name":"u_curriculum.asp", "type":"File", "extension":"asp"}, {"pno":58, "no":111, "fullPath":"ko%5Cu_intro.asp", "name":"u_intro.asp", "type":"File", "extension":"asp"}]}, {"pno":0, "no":112, "fullPath":"list.asp", "name":"list.asp", "type":"File", "extension":"asp"}]

                fnObj.tree.target.setTree(tree);
            },
            setSize: function(height){
                axdom("#menu-navigator").css({height:height - 45});
                fnObj.tree.target.resetHeight();
            }
        }
	};
    axdom(window).ready(fnObj.pageStart);
    axdom(window).resize(fnObj.pageResize);
	</script>
</head>
<body>
<div id="AXPage" class="bodyHeightDiv">
    <div class="ax-modal-header">
        <div class="ax-col-12">
            <div class="ax-unit">
                <h1>컨텐츠 제목</h1>
            </div>
        </div>
        <div class="ax-clear"></div>
    </div>
	<div class="ax-modal-body">
        <div class="ax-wrap">
            <div class="ax-layer">
                <div class="ax-col-12">
                    <div id="menu-navigator"></div>
                </div>
                <div class="ax-clear"></div>
            </div>
        </div>
    </div>
    <div class="ax-modal-footer">
        <div class="ax-wrap">
            <div class="ax-col-12">
                <div class="ax-unit center">
                    <button type="button" class="AXButton" onclick="parent.myModal.close();">확인</button>
                    <button type="button" class="AXButton" onclick="parent.myModal.close();">취소</button>
                </div>
            </div>
            <div class="ax-clear"></div>
        </div>
    </div>
</div>
</body>
</html>
