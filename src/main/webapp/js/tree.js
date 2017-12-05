var jsonData = [
  
    {
        "attributes": { "url": null },
        "checked": false,
        "iconCls": "icon-clgl",
        "id": "L20",
        "text": "车 辆 管 理",
        "child":[
            {
                "attributes": { "url": "getCarTrajectory.do" },
                "checked": false,
                "iconCls": "icon-list",
                "id": "L2010",
                "parent":"L20",
                "text": "车辆管理"
            },
        ]
    },
    {
        "attributes": { "url": null },
        "checked": false,
        "iconCls": "icon-khgl",
        "id": "L30",
        "text": "人员管 理",
        "child":[
            {
                "attributes": { "url": "getUsers.do" },
                "checked": false,
                "iconCls": "icon-list",
                "id": "L3010",
                "parent":"L30",
                "text": "普通客户管理"
            },{
                "attributes": { "url": "getUsers.do" },
                "checked": false,
                "iconCls": "icon-list",
                "id": "L3010",
                "parent":"L30",
                "text": "VIP客户管理"
            },{
                "attributes": { "url": "getUsers.do" },
                "checked": false,
                "iconCls": "icon-list",
                "id": "L3010",
                "parent":"L30",
                "text": "超级管理员管理"
            }
        ]
    },
    {
        "attributes": {   "url": null },
        "checked": false,
        "iconCls": "icon-fyjs",
        "id": "L40",
        "text": "费 用 结 算",
        "child":[
            {
                attributes: {url : ""},
                "checked": false,
                "iconCls": "icon-list",
                "id": "L4010",
                "parent":"L40",
                "text": "租车费用结算"
            },{
                attributes: {url : ""},
                "checked": false,
                "iconCls": "icon-list",
                "id": "L4010",
                "parent":"L40",
                "text": "违约金结算"
            },{
                attributes: {url : ""},
                "checked": false,
                "iconCls": "icon-list",
                "id": "L4010",
                "parent":"L40",
                "text": "其他结算"
            }
        ]
    },
    {
        "attributes": { "url": null },
        "checked": false,
        "iconCls": "icon-ddgl",
        "id": "L10",
        "text": "订单 管 理",
        "child":[
            {
                "attributes": { "url": "" },
                "checked": false,
                "iconCls": "icon-list",
                "id": "L1010",
                "parent":"L10",
                "text": "未完成的订单"
            },
            {
                "attributes": {   "url": "" },
                "checked": false,
                "iconCls": "icon-list",
                "id": "L1020",
                "parent":"L10",
                "text": "进行中的订单"
            },
            {
                "attributes": {   "url": "" },
                "checked": false,
                "iconCls": "icon-list",
                "id": "L1020",
                "parent":"L10",
                "text": "已完成的订单"
            }
        ]
    }
    
]
