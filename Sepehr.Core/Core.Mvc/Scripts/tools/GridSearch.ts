﻿/// <reference path="../typings/jquery.ui.datetimepicker/jquery.ui.datetimepicker.d.ts" />

/// <reference path="../typings/underscore/underscore.d.ts" />
/// <reference path="lookup.ts" />
/// <reference path="../custom-types/browsers.ts" />
/// <reference path="../typings/jquery/jquery.d.ts" />


module ns_Search {

    var searchObjs = [], currentSearchObj = null, initialFilterItems = {}, currentActiveSearch: searchObj;

    export class searchObj {
        searchWindowAttributes;
        windowContainer;
        winContentcontainer;
        gridSelector;
        gridData;
        afterFirstContentUrlAssigned = false;
        andOrDropDownAlreadyAssigned = false;
        localContent;
        win;
        searchableColumnsList = [];
        selectedColumnCriteria = {}; 
        fieldOptcont = null;
        columnCont = null;
        schemaTypes = null;
        booleanValContainer = {};
        multiValueFields = {};
        cGId = 0;
        instance;
        activeRowIndex;

    initializeSearchObj(gridId) {
        this.buildWindowContentAttributes(gridId);
        this.buildWindowContentTemplate(gridId);
        this.buildSearchWindow(gridId);
            //TODO: 1.Make a dynamic div and content template of search window.
            //      2.Wrap a kendo window over the div and then open the window.
            //        2.1.If a div and the kendo window data is previously assigned,remove them.
            //return true;
        }

    buildWindowContentAttributes(gridId) {
        this.searchWindowAttributes = { 'contentSearchId': 'searchGrid_' + gridId, 'winContainerId': 'win_se_' + gridId };
        }

    buildWindowContentTemplate(gridId) {
        var contentTemplate = '<div style=\"height:auto;\">' +
            '<div style=\"position: relative; height:15em; max-height:15em; overflow:auto;\">' +
            '<div id=\"' + this.searchWindowAttributes.contentSearchId + '\" class=\"k-rtl\"><\\/div>' +
            '<\\/div>' +
            '<div class=\"k-rtl\" style=\"float:left; position:absolute; bottom:5px;right:80%;\">' +
            "<input type=\"button\" onclick=\" var curSObj = ns_Search.getCurrentActiveSearchObj('" + gridId + "'); if(curSObj)    if(curSObj.sObj.buildCurrentSearchList() === 'success' )  curSObj.sObj.closeSearchWin('search_div'); \" class='btn-ok k-button k-button-icontext' href='\\#'><span class='k-icon k-i-tick' ><\\/span>تایید<\\/a> " +
            "<input type=\"button\" onclick=\" var curSObj = ns_Search.getCurrentActiveSearchObj('" + gridId + "'); if(curSObj) curSObj.sObj.closeSearchWin(); \" class='btn-cancel k-button k-button-icontext' href='\\#'><span class='k-icon k-i-cancel'><\\/span>انصراف<\\/a>" +
            '<\\/div>' +
            '<\\/div>';
        this.winContentcontainer = contentTemplate;
        }

    buildSearchGrid() {
        var that = this;
        currentActiveSearch = that;
        var columnObj = that.getColumnObj(that.searchableColumnsList[0]);
        var gridData = {
            data: [{
                fld: columnObj,
                opt: that.getFirstItemOperatorBasedOnColType(columnObj.columnId.type),
                andor: { andorId: "or", andorName: "یا" }
            }]
        };
        $("#" + that.searchWindowAttributes.contentSearchId).kendoGrid({
            columns: [
                { field: "fld", title: "ستون", editor: that.columnDropDownEditor, template: "#=fld.columnName#", width: 130 },
                { field: "opt", title: "عملگر", editor: that.operatorDropDownEditor, template: "#=opt.operatorName#", width: 150 },
                { field: "val", title: "مقدار", editor: that.valComplexInputsEditor, width: 230 },
                { field: "andor", title: "ترکیب شرط ها", editor: that.andorDropDownEditor, template: "#=andor.andorName#", width: 85 },
                { command: [{ name: "destroy", text: "حذف قاعده" }] , width: 110 }],
            toolbar: [
                { template: "<a  onclick=' var curSObj = ns_Search.getCurrentActiveSearchObj(\"" + that.cGId + "\"); if(curSObj) {   curSObj.sObj.addCriteriaRecord();  }' +  class='k-button k-button-icontext' href='\\#'> <span class='k-icon k-i-plus' ><\\/span><\\/a>" }
            ],
            editable: { confirmation: false },
            autoBind: true,
            dataBound: function (e) {
                e.sender.tbody.find("tr > td:first-child").trigger('click');
                e.sender.tbody.find("tr > td:last-child > a.k-button").css('width', '100');
            },
            dataSource: gridData,
            edit: function (e) {
            },
            change: function (e) {

            },
            save: function (e) {

            }
        });
     }

    selectDeselectCheckBox (chkItem, trueText, falseText) {
        if ($(this).prop('checked')) {
            $(this).text(trueText);
        }
        else {
            $(this).text(falseText);
        }
    }

    addCriteriaRecord() {
        var that = this;
        var datSource = $("#" + that.searchWindowAttributes.contentSearchId).data("kendoGrid").dataSource;
        var columnObj = that.getColumnObj(that.searchableColumnsList[0]);
        datSource.add({
            fld: columnObj,
            opt: that.getFirstItemOperatorBasedOnColType(columnObj.columnId.type),
            andor: { andorId: "or", andorName: "یا" }
        });
    }

    getDataFields () {
        var that = this;
        var columns = that.searchableColumnsList;
        var fieldData = [];
        for (var i = 0; i < columns.length; i++) {
            fieldData.push(that.getColumnObj(columns[i]))
        }
        return fieldData;
    }

    getColumnObj(column) {
        var that = this;
        var fields = that.gridData.options.schema.model.fields;
        var retcol;
        $.each(fields, function (key, val) {
            if (column.field == key) {
                retcol = { columnId: { type: that.getFieldSpecificType(column, val, that.schemaTypes), LId: that.getTrueFieldName(key), TId: key }, columnName: column.title };
                return;
            }
        });
        return retcol;
        }

    getTrueFieldName(key) {
        var that = this;
        if (that.schemaTypes[key]) { if (that.schemaTypes[key].mdlPropName) return that.schemaTypes[key].mdlPropName; }
        return key;
        }

    getFieldSpecificType(column, val, sTypes) {
        var col = undefined;

        //if (sTypes[column.field])
        //    if (sTypes[column.field].custType != undefined) {
        //        col = sTypes[column.field];
        //    }
        for (var field in sTypes)
        {
            if (field.toLocaleLowerCase() == column.field.toLocaleLowerCase())
                col = sTypes[field];
        }
        return col ? col.custType : val.type;
        }

    columnDropDownEditor(cont, options) {
        var that = currentActiveSearch;
        that.columnCont = cont;
        $('<input id="column" data-text-field="columnName" data-value-field="columnId.LId" data-bind="value:' + options.field + '"/>')
            .appendTo(cont)
            .kendoDropDownList({
                autoBind: false,
                dataSource: { data: that.getDataFields(), events: { requestEnd: (e) => { } } },
                animation: {
                    close: {
                        effects: "fadeOut zoom:out",
                        duration: 300
                    },
                    open: {
                        effects: "fadeIn zoom:in",
                        duration: 300
                    }
                },
                dataBound: (e) =>{
                    var parentRowId = that.columnCont.parent("tr").attr("data-uid");
                    if (!that.selectedColumnCriteria[parentRowId]) {
                        var val = e.sender.dataSource.options.data[0];
                        that.selectedColumnCriteria[parentRowId] = val;
                        that.columnCont.parent("tr").find("td:first-child()").focus();
                    }
                },
                select: (e) =>{
                    var foundItem;
                    $.each(e.sender.dataSource.options.data, (key, val) =>{
                       
                        if (key == $(e.item).index()) {
                            var parentRowId = cont.parent("tr").attr("data-uid");
                            that.selectedColumnCriteria[parentRowId] = val;
                            that.columnCont.parent("tr").find("td:nth-child(2)").focus();
                            that.columnCont.parent("tr").find("td:nth-child(2)").text();
                            return;
                        }
                    });
                },
                change: (e) =>{
                }
            });
        }

    getFirstItemOperatorBasedOnColType(colType, columnItem?) {
        var that = currentActiveSearch;
        var specificFieldOperators = null;
        switch (colType.toLowerCase()) {
            case 'number':
            case 'digit':
                return { operatorName: "برابر با", operatorId: "eq" };
            case 'bool':
                specificFieldOperators = that.getBooleanRelatedOperators();
                break;
            case 'boolean':
                break;
            case 'string':
            case 'navigation':
                return { operatorName: "برابر با", operatorId: "eq" };
            case 'lookUp':
                specificFieldOperators = that.getLookupRelatedOperators();
                break;
            case 'date':
                //specificFieldOperators = that.getDateRelatedOperators();
                //break;
            case 'datetime':
                return { operatorName: "برابر تاریخ ", operatorId: "eq" };
            case 'time':
                specificFieldOperators = that.getTimeRelatedOperators();
                break;
            default:
                specificFieldOperators = that.getTheWholeRules();
        }

        }

    getBooleanFirstItem (colItem) {
        var col:any = _.find(this.schemaTypes, (col_item:any) => {
            return this.schemaTypes[colItem.field] && col_item.custType.toLowerCase() == 'boolean';
        });
        var boolObj;
        if (col) {
            boolObj = { boolVal: col.falseEqui, boolText: col.falseEqui };
        }
        return boolObj;
    }

    operatorDropDownEditor(cont, options) {
        var that = currentActiveSearch;
        var fieldOptcont = cont;
        var parentRowId = cont.parent("tr").attr("data-uid");
        if (that.selectedColumnCriteria[parentRowId]) {
            var fld = that.selectedColumnCriteria[parentRowId];
            if (fld.columnId.type.toLowerCase() != 'bool' && fld.columnId.type.toLowerCase() != 'boolean' && fld.columnId.type.toLowerCase() != 'enum') {
                $('<input required data-text-field="operatorName" data-value-field="operatorId" data-bind="value:' + options.field + '"/>')
                    .appendTo(cont)
                    .kendoDropDownList({
                        autoBind: false,
                        dataSource: that.getOperatorsByType(that.selectedColumnCriteria[fieldOptcont.parent("tr").attr("data-uid")].columnId.type),
                        dataBound: (e) =>{
                        },
                        select: (e) =>{
                        }
                    });
            }
            else {
                $("<span  class='k-dirty-cell' >برابر با</span>").appendTo(cont);
            }
        }
        }

    getOperatorsByType(fldType) {
        var that = currentActiveSearch;
        var specificFieldOperators = null;
        switch (fldType.toLowerCase()) {
            case 'number':
            case 'digit':
                specificFieldOperators = that.getIntRelatedOperators();
                break;
            case 'enum':
            case 'boolean':
            case 'bool':
                specificFieldOperators = that.getEqualityOperator();
                break;
            case 'string':
            case 'navigation':
                specificFieldOperators = that.getStringRelatedOperators();
                break;
            case 'lookUp':
                specificFieldOperators = that.getLookupRelatedOperators();
                break;
            case 'date':
                specificFieldOperators = that.getDateRelatedOperators();
                break;
            case 'datetime':
                specificFieldOperators = that.getDateTimeRelatedOperators();
                break;
            case 'time':
                specificFieldOperators = that.getTimeRelatedOperators();
                break;
            default:
                specificFieldOperators = that.getTheWholeRules();
        }
        return specificFieldOperators;
        }

    getEqualityOperator() {
        return "برابر با";
        }

    getIntRelatedOperators() {
        return [{ operatorName: "برابر با", operatorId: "eq" },
            { operatorId: "neq", operatorName: "رقمی غیر از" },
            { operatorName: "بزرگتر از", operatorId: "gt" },
            { operatorName: "کوچکتر از ", operatorId: "lt" }];
        }

    getBooleanRelatedOperators() {
        return [{ operatorName: "اعمال", operatorId: "eq" },
            { operatorId: "neq", operatorName: "عدم اعمال" }];
        }

    getStringRelatedOperators() {
        return [{ operatorName: "برابر با", operatorId: "eq" },
            { operatorName: "شامل عبارت", operatorId: "contains" },
            { operatorName: "شامل نشود عبارت", operatorId: "doesnotcontain" },
            { operatorName: "(به ترتیب الفبا)بعد از عبارت", operatorId: "gte" },
            { operatorName: "(به ترتیب الفبا)قبل از عبارت", operatorId: "lte" },
        ];
        }

    getLookupRelatedOperators() {
        return [{ operatorName: "برابر با", operatorId: "eq" }];
        }

    getDateRelatedOperators() {
        return [{ operatorName: "برابر با", operatorId: "eq" },
            { operatorId: "neq", operatorName: "غیر از تاریخ" },
            { operatorName: "بعد از تاریخ", operatorId: "gt" },
            { operatorName: "قبل از تاریخ", operatorId: "lt" }];
        }

    getDateTimeRelatedOperators() {
        return [{ operatorName: "برابر با", operatorId: "eq" },
            { operatorName: "نا برابر با", operatorId: "neq" },
            { operatorName: "بعد از تاریخ", operatorId: "gt" },
            { operatorName: "قبل از تاریخ", operatorId: "lt" }]

        }

    getTimeRelatedOperators() {
        return [{ operatorName: "برابر با", operatorId: "eq" },
            { operatorId: "neq", operatorName: "غیر از زمان" },
            { operatorName: "بعد از زمان", operatorId: "gt" },
            { operatorName: "قبل از زمان", operatorId: "lt" }];
        }

    getTheWholeRules() {
        return [{ operatorName: "برابر با", operatorId: "eq" },
            { operatorName: "رقمی غیر از", operatorId: "neq", },
            { operatorName: "شامل رقم(رقم ها)", operatorId: "contains" },
            { operatorName: "بزرگتر از", operatorId: "gt" },
            { operatorName: "کوچکتر از ", operatorId: "lt" },
            { operatorName: "عبارتی غیر از", operatorId: "neq" },
            { operatorName: "شامل عبارت", operatorId: "contains" },
            { operatorName: "شامل نشود عبارت", operatorId: "doesnotcontain" },
            { operatorName: "(به ترتیب الفبا)بعد از عبارت", operatorId: "gte" },
            { operatorName: "(به ترتیب الفبا)قبل از عبارت", operatorId: "lte" },
            //{ operatorName: "برابر با تاریخ ", operatorId: "eq" },
            { operatorName: "غیر از تاریخ", operatorId: "neq", },
            { operatorName: "بعد از تاریخ", operatorId: "gte" },
            { operatorName: "قبل از تاریخ", operatorId: "lte" },
            //{ operatorName: "برابر با زمان", operatorId: "eq" },
            { operatorName: "اعمال", operatorId: "eq" },
            { operatorName: "عدم اعمال", operatorId: "neq" },
            { operatorName: "غیر از زمان", operatorId: "neq" },
            { operatorName: "بعد از زمان", operatorId: "gte" },
            { operatorName: "قبل از زمان", operatorId: "lte" }

        ]
        }

    andorDropDownEditor(container, options) {
        $('<input required data-text-field="andorName" data-value-field="andorId" data-bind="value:' + options.field + '"/>')
            .appendTo(container)
            .kendoDropDownList({
                autoBind: false,
                dataSource: [{ andorId: "or", andorName: "یا" }, { andorId: "and", andorName: "و" }]
            });
        }

    valComplexInputsEditor(container, options) {
        var that = currentActiveSearch;
        that.makeInputElement(container, options);
        }

    extractFilterObjectFromDataSource() {
        var alreadyInsertedCond = [];
        var that = currentActiveSearch;
        //Doing some manipulation on data which are going to be put in filterObject.
        $.each($("#" + that.searchWindowAttributes.contentSearchId).data("kendoGrid").dataSource.data(), (key, val) => {
            if (val.keys != undefined || val.keys != null) {
                //TODO:Check whether the value is multiple or singular.
                val.val = val.keys;
            }
            if (val.fld.columnId.type.toLowerCase() === "datetime") {
                val.val += ",dt"
            }
            else if (val.fld.columnId.type.toLowerCase() === "navigation") {
                val.val += ",nv:" + that.getNavigationPropertyValue(val.fld.columnId.LId);
            }
            else if (val.fld.columnId.type.toLowerCase() === "lookup") {
                var lookupObj = that.getLookupPropertyValue(val.fld.columnId.LId);
                var navTotalName;
                if (lookupObj.navigatePropertyUnderlayingModelName === '') {
                    throw 'Underlaying model name of the navigation property is not defined';
                }
                else {
                    if (lookupObj.navigatePropertyUnderlayingModelIdName === '') {
                        if (lookupObj.bindingName !== '') {
                            navTotalName = lookupObj.navigatePropertyUnderlayingModelName + "." + lookupObj.bindingName;
                        }
                    }
                    else {
                        navTotalName = lookupObj.navigatePropertyUnderlayingModelName + "." + lookupObj.navigatePropertyUnderlayingModelIdName;
                    }
                }
                val.val += ",lkp:" + navTotalName;
            }
            alreadyInsertedCond.push(val);
        });
        var filterRuleOperation, currentFilterRule = { logic: "and", filters: [] }, fc, nullCond = false;
        for (var i = 0, j = 1; i < alreadyInsertedCond.length; i++, j++) {
            if (j == 2 || j == 1) {
                filterRuleOperation = i != 0 ? alreadyInsertedCond[i - 1].andor.andorId : alreadyInsertedCond[0].andor.andorId;
                currentFilterRule.logic = filterRuleOperation;

                fc = that.makeFilterItem(alreadyInsertedCond[i]);
                if (fc) {
                    currentFilterRule.filters.push(fc);
                }
                else {
                    nullCond = true;
                }
            }
            else {
                fc = that.makeFilterItem(alreadyInsertedCond[i]);
                if (fc) {
                    filterRuleOperation = alreadyInsertedCond[i - 1].andor.andorId;
                    var newRule = {}, midEvenRule = { logic: "and", filters: [] };
                    newRule = fc;
                    midEvenRule.filters.push(newRule);
                    midEvenRule.logic = filterRuleOperation;
                    midEvenRule.filters.push(currentFilterRule);
                    currentFilterRule = { logic: "and", filters: [] };
                    currentFilterRule.filters = midEvenRule.filters;
                    currentFilterRule.logic = filterRuleOperation;
                }
                else {
                    nullCond = true;
                }
            }
        }
        if (alreadyInsertedCond.length == 0 || nullCond) return null;
        return currentFilterRule;
     }

    makeFilterItem(insertingCond) {
        if (insertingCond.val == undefined || insertingCond.val === '') return null;
        else {
            var v = insertingCond.val;
            var filterItem = { field: insertingCond.fld.columnId.LId, operator: insertingCond.opt.operatorId, value: v };
            return filterItem;
          }
      }

        //inputTypeEntry(container, options, a, b, c) {
        //    if (options.model) { options = obj.model.fld.columnId; }
        //    return this.makeInputElement(container, options);
        //}

    getNavigationPropertyValue(fieldVal) {
        var navProp = this.schemaTypes[fieldVal].navProp;
        return navProp;
        }

    getLookupPropertyValue(fieldVal) {
        var lookupProp = this.schemaTypes[fieldVal].lookup;
        return lookupProp;
     }

    removeAnyPreviouslyInsertedItems(con) {
        con.find('span').remove();
        con.find('input').remove();
    }

    makeBooleanCheckBoxStr(cont, columnCriteria, options) {
        var that = this;
        if (this.schemaTypes[columnCriteria.columnId.TId]) {
            var columnItem = that.schemaTypes[columnCriteria.columnId.TId];
            if (columnItem) {
                $('<input type="text" id="bool_val"  data-text-field="text" data-value-field="tag" data-bind="value:' + options.field + '"/>')
                    .appendTo(cont)
                    .kendoDropDownList({
                        autoBind: false,
                        dataSource: [{ tag: false, text: columnItem.falseEqui }, { tag: true, text: columnItem.trueEqui }],
                        dataBound: (e) => {
                        },
                        select:(e) => {
                            that.gridSelector.setDataSourceItemVal(e.item.text(), e.sender.dataSource.data[e.item.index()].tag);
                        }
                    });
            }
        }
        }

    makeEnumDdl(cont, columnCriteria, options) {
        var that = this;
        if (that.schemaTypes[columnCriteria.columnId.TId]) {
            var columnItem = that.schemaTypes[columnCriteria.columnId.TId];
            if (columnItem) {
                $('<input type="text" id="enum_ddl"  data-text-field="text" data-value-field="tag" data-bind="value:' + options.field + '"/>')
                    .appendTo(cont)
                    .kendoDropDownList({
                        autoBind: false,
                        dataSource: that.getEnumDataSourceEquivalent(columnItem),
                        dataBound: function (e) {
                        },
                        select: function (e) {
                            that.gridSelector.setDataSourceItemVal(e.item.text(), e.sender.dataSource.data[e.item.index()].tag);
                        }
                    });
            }
        }
        }

    getEnumDataSourceEquivalent(colItem){
        var eDic = colItem.enumDic;
        var enumDataSource = [];
        if (eDic) {
            $.each(eDic, function (key, val) {
                enumDataSource.push({ tag: key, text: val });
            });
            return enumDataSource;
        }
     }

    makeInputElement(cont, options) {
        var that = currentActiveSearch;
        var parentRowId = cont.parent("tr").attr("data-uid");
        if (that.selectedColumnCriteria[parentRowId]) {
            var columnCriteria = that.selectedColumnCriteria[parentRowId];
            var columnType = columnCriteria.columnId.type;
            that.removeAnyPreviouslyInsertedItems(cont);
            switch (columnType.toLowerCase()) {
                case 'number':
                case 'digit':
                    $('<input type="text" data-role="numerictextbox"  class="k-input" data-bind="value:' + options.field + '"/>').appendTo(cont);
                    break;
                case 'bool':
                    $('<input type="checkbox" class="k-input k-checkbox"  data-bind="value:' + options.field + '"/>').appendTo(cont);
                    break;
                case 'boolean':
                    that.makeBooleanCheckBoxStr(cont, columnCriteria, options);
                    break;
                case 'enum':
                    that.makeEnumDdl(cont, columnCriteria, options);
                    break;
                case 'string':
                case 'navigation':
                    $('<input type="text"  class="k-input k-textbox"  data-bind="value:' + options.field + '"/>').appendTo(cont);
                    break;
                case 'lookup':
                   
                    var lookup = that.schemaTypes[columnCriteria.columnId.TId].lookup;
                    //type, title, viewModelName, ViewInfoName, lookupName, displayName, valueName, bindingName, isMultiselect, width, height
                    var lkpIndx = cont.parent('tr').index();

                    var lkp = Lookup.createControl(
                        lookup.type,
                        lookup.title,
                        lookup.viewModelName,
                        lookup.ViewInfoName,
                        lookup.lookupName + "_" + lkpIndx,
                        lookup.displayName,
                        lookup.valueName,
                        lookup.bindingName,
                        lookup.isMultiselect,
                        900,
                        500);
                   

                    lkp.onOpen = function () {
                        that.gridSelector.preventCellDestroy();
                    };

                    lkp.onClose = function () {
                        var text = cont.find("input[type='text']").val();
                        var value = cont.find("input[type='hidden']").val();
                        that.gridSelector.setDataSourceItemVal(text, value);
                        that.gridSelector.allowCellDestroy();
                        cont.parent('tr').find("td:nth-child(4)").trigger('click');
                    };
                    lkp._outerHtml.appendTo(cont);
                    break;
                case 'date':
                    break;
                case 'datetime':
                   
                    that.gridSelector.preventCellDestroy();
                    cont.append('<input  type="text" class="k-input k-textbox"  id="dateTimeInput" data-bind="value:' + options.field + '"/>')
                    that.setDateTimePicker();
                    break;
                case 'time':
                    break;
                default:
                    $('<input type="text" class="k-input k-textbox" data-bind="value:' + options.field + '"/>').appendTo(cont);
            }
          }
     }

    setDateTimePicker():void {
        var that = currentActiveSearch;
        $("#dateTimeInput").datepicker({
            changeMonth: true,
            changeYear: true,
            showButtonPanel: true,
            yearRange: 'c-90:c+10',
            dateFormat: 'yy/mm/dd',
            beforeShow: function (e) {
                that.gridSelector.preventCellDestroy();
                return null;
            },
            onClose: function (e) { that.gridSelector.allowCellDestroy(); },
            showOn: 'focus'
        });
        $('#ui-datepicker-div').css('zIndex', '10000003');
        $('#ui-datepicker-div').css('font-size', 'x-small');

       // return dateTimeInput;
    }

    ifFieldIsNotExcluding(colItem) {
        var itemInclude = true;
        var st = this.schemaTypes;
        if (st.excludingFields)
            if (st.excludingFields.indexOf(',') != -1) {
                var excludingFields = st.excludingFields.split(',');
            }
            else {
                var excludingField = st.excludingFields;
                if (colItem.field === excludingField) { itemInclude = false; }
            }
        return itemInclude;
     }

    buildCurrentSearchList() {
        var that = currentActiveSearch;
        var filterObject = that.extractFilterObjectFromDataSource();
        if (filterObject) {
            if (initialFilterItems) {
                if (initialFilterItems[that.cGId]) {
                    var fRule = { logic: "and", filters: [] };
                    fRule.filters.push(initialFilterItems[that.cGId]);
                    fRule.filters.push(filterObject);
                    that.gridSelector.dataSource.filter(fRule);
                }
                else {
                    that.gridSelector.dataSource.filter(filterObject);
                }
            }
            else {
                that.gridSelector.dataSource.filter(filterObject);
            }
            destroyActiveSearchComponentRearrange();
            currentActiveSearch = getCurrentActiveSearchObj();
            that.win.destroy();
        }
        else {
            DialogBox.ShowError("حداقل یک قاعده دارای مقدار نسیت ، یا هیچ قاعده ای وجود ندارد.", 400, 50, true);
        }
        }

    closeSearchWin (searchDiv) {
        var that = currentActiveSearch;
        that.win.destroy();
        }

    buildSearchWindow (gridId) {
        var that = this;
        that.searchableColumnsList = [];
        that.cGId = gridId;
        that.gridSelector = $("#" + gridId).data('kendoGrid');
        if ($("#" + that.searchWindowAttributes.winContainerId)) { $("div#" + that.searchWindowAttributes.winContainerId).remove(); }
        that.windowContainer = $("<div id='" + that.searchWindowAttributes.winContainerId + "' ></div>");

        that.gridData = that.gridSelector.dataSource;
        that.schemaTypes = that.gridSelector.dataSource.options.schema.searchCustomTypes;

        $.each(that.gridSelector.columns, function (key, val) {

            if (!val.hidden && that.ifFieldIsNotExcluding(val)) {
                that.searchableColumnsList.push(val);
            }
        });
        this.localContent = { template: that.winContentcontainer }
        that.win = that.windowContainer.kendoWindow({
            actions: ["Close"],
            width: 900,
            height: 250,
            modal: true,
            title: "جستجو",
            encoded: false,
            visible: false,
            resizable: true,
            activate: function (e) {
                that.buildSearchGrid();
            },
            scrollable: false,
            animation: { open: { effects: "zoom:in fade:in", duration: 400 }, close: { effects: "zoom:out fade:out", duration: 400 } },
            content: this.localContent,
            close: function (e) {
                destroyActiveSearchComponentRearrange();
                currentActiveSearch = this.getCurrentActiveSearchObj().sObj;
                this.destroy();
            }
        }).data("kendoWindow");
        that.win.center().open();
    }

    }

    export var widgetsSofar = {}
 
    export function loadGridSearch  (gridId) {
        var gridSearchObj = new searchObj();
        setCurrentActiveSearchObj(gridId, gridSearchObj);
        gridSearchObj.initializeSearchObj(gridId);
    }
    export var widgetsSofar = {};
    export function setCurrentActiveSearchObj(gridId, searchObj) {
        makeOtherSearchObjsInactive();
        var grdObj = { 'gId': gridId, 'sObj': searchObj, 'active': true };
        searchObjs.push(grdObj);
    }
           
    export function getCurrentActiveSearchObj(gridId?): searchObj {
        var retSearchObj:searchObj = null;
        if (searchObjs.length > 0) {
            retSearchObj = searchObjs[searchObjs.length - 1];
        }
        return retSearchObj;
    }
           
    export function destroyActiveSearchComponentRearrange () {
        if (searchObjs.length > 1) {
            searchObjs = searchObjs.slice(0, searchObjs.length - 1);
        }
    }
           
    export function getSearchComponent(type, options, override) {
        var component = null;
        if (type === 'objInstance') {
            component = searchObj;
        }
        else if (type === 'contentTemplate') {
            //component = searchContentTemplate;
        }
        return new component(options);
    }
           
    export function setGridInitialFilterRule(gId, initFilterItem) {
        initialFilterItems[gId] = initFilterItem;
    }
           
    export function ifGridHasInitialFilterRule(gId) {
        if (initialFilterItems[gId]) return true;
        else return false;
    }
           
    export function getInitialFilterOfGrid(gId) {
        return initialFilterItems[gId];
    }
           
    export function makeOtherSearchObjsInactive() {
        if (searchObjs.length > 0) {
            for (var i = 0; i < searchObjs.length; i++) {
            }
        }
    }

}
