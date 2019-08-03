layui.use(['layer', 'table', 'jquery'], function () {

    var table = layui.table,
        layer = layui.layer,
        $ = jQuery = layui.$;

    table.render({
        id: "tb",//id，唯一标识
        elem: "#mytab"//要绑定的数据表格
        , url: 'stu?method=load' //数据接口
        , height: 'full' //高度最大化
        , page: true //开启分页
        , skin: 'line' //行边框风格
        , even: true //开启隔行背景
        , size: 'lg' //大尺寸的表格
        , title: "学员系统"//标题
        , text: "数据显示异常"
        , page: true//分页
        , limit: 5//默认每页显示5条
        , limits: [1, 2, 3, 5, 10, 20, 30]//显示条数列表
        , toolbar: "#toolbarDemo" //显示工具栏
        , cols: [[
            {type: 'checkbox', fixed: 'left'},
            {type: "numbers", align: "center", title: "编号", width: "5%", sort: true},
            {field: "stu_name", align: "center", title: "姓名", width: "8%", sort: true},
            {field: "stu_gender", align: "center", title: "性别", width: "3%", sort: true},
            {field: "stu_tel", align: "center", title: "电话号码", width: "12%"},
            {field: "stu_email", align: "center", title: "邮件", width: "10%"},
            {field: "stu_bir", align: "center", title: "出生日期", width: "10%", sort: true},
            {field: "stu_address", title: "地址", width: "20%"},
            {field: "remark", align: "center", title: "备注", width: "15%"},
            , {fixed: "right", width: 165, align: 'center', toolbar: '#barDemo'}
        ]]
    });


    //监听行工具事件
    table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        var data = obj.data //获得当前行数据
            , layEvent = obj.event; //获得 lay-event 对应的值

        if (layEvent === 'detail') {
            layer.open({
                type: 2, //弹出层的类型
                anim: 2, //进入的动画方式
                title: '信息详情',
                shadeClose: true,
                shade: 0.8,
                area: ['480px', '90%'],
                content: 'detail.jsp',//这里content是一个普通的String
                success: function (layero, index) {
                    var body = layui.layer.getChildFrame('body');
                    body.find("[name=name]").val(data.stu_name);
                    body.find("[name=tel]").val(data.stu_tel);
                    body.find("[name=email]").val(data.stu_email);
                    body.find("[name=bir]").val(data.stu_bir);
                    body.find("[name=address]").val(data.stu_address);
                    body.find("[value=" + data.stu_gender + "]").attr("checked", "checked");
                    body.find("[name=remark]").val(data.remark);

                }
            });
        } else if (layEvent === 'del') {
            layer.confirm('真的删除行么', function (index) {
                obj.del(); //删除对应行（tr）的DOM结构
                layer.close(index);
                //向服务端发送删除指令
                $.ajax({
                    url: "stu",
                    data: {"method": "del", "id": data.stu_id},
                    type: "post",
                    success: function () {

                        table.reload("tb", {
                            page: {curr: 1},//重载以后，回到第1页
                            where: {time: new Date()}//防止缓存
                        });
                    }
                });
            });
        } else if (layEvent === 'edit') {
            //alert('编辑操作'+data.stu_name+","+data.stu_bir);
            layer.open({
                type: 2, //弹出层的类型
                anim: 3, //进入的动画方式
                title: '修改用户',
                shadeClose: true,
                shade: 0.8,
                area: ['480px', '90%'],
                content: 'update.jsp',//这里content是一个普通的String
                success: function (layero, index) {
                    var body = layui.layer.getChildFrame('body');
                    body.find("[name=id]").val(data.stu_id);
                    body.find("[name=name]").val(data.stu_name);
                    body.find("[name=tel]").val(data.stu_tel);
                    body.find("[name=email]").val(data.stu_email);
                    body.find("[name=bir]").val(data.stu_bir);
                    body.find("[name=address]").val(data.stu_address);
                    body.find("[value=" + data.stu_gender + "]").attr("checked", "checked");
                    body.find("[name=remark]").val(data.remark);

                },
                end: function () {
                    //table.reload("tb");//重新加载数据
                    //layer.msg("数据修改成功",{icon:1});
                }
            });
        }
    });//table.render结束标记

    //点击查询，根据条件查询，并且重新加载数据
    $("#search").click(function () {
        var nameVal = $("#name").val();
        var addressVal = $("#address").val();

        table.reload("tb", {
            page: {curr: 1},//重载以后，回到第1页
            where: {
                name: nameVal,
                address: addressVal
            }
        });
    });
    //重置，清空数据
    $("#reset").click(function () {
        $("input").val("");
    });

    //添加
    $("#addBtn").click(function () {
        //alert("#########");
        layer.open({
            type: 2, //弹出层的类型
            anim: 3, //进入的动画方式
            title: '添加用户',
            shadeClose: true,
            shade: 0.8,
            area: ['480px', '90%'],
            content: 'add.jsp'//这里content是一个普通的String
        });
    });
});//layui.use结束标志

