Begin Transaction;
begin try
begin

update [core].ViewElements
set ParentId=null where LOWER(UniqueName) like '%core%'

delete from core.ViewElements where LOWER(UniqueName) like '%core%'
/****** Object:  Table [core].[ViewElements]    Script Date: 05/18/2016 12:40:46 ******/

INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'MenuCoreGeneralSetting#', N'تنظیمات عمومی', 0, N'Areas/Core/Content/images/settings.png', NULL, 0, 0, 5, 3)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/Account/Register#Core/Account/Register', N'عضویت', 1, NULL, 3, 1, 0, 1000, 11)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'AccountApi/PutEntity#Core/AccountApi/PutEntity', N'خروج', 1, NULL, 3, 1, 0, 1000, 14)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/Home/Index#Core/Home/Index', N'شاخص Core/Home', 1, NULL, 3, 1, 0, 1000, 15)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/Home/MainMenu#Core/Home/MainMenu', N'Home', 1, NULL, 3, 1, 0, 1000, 26)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'MenuUser#Core/User/Index', N'مدیریت کاربران', 0, NULL, 3, 0, 0, 1000, 67)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'MenuRole#Core/Role/Index', N' نقش', 0, NULL, 3, 0, 0, 1000, 68)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'RoleApi/GetEntities#Core/RoleApi/GetEntities', N'مشاهده نقش', 1, NULL, 68, 0, 0, 1000, 69)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'RoleApi/PostEntity#Core/RoleApi/PostEntity', N'تعریف نقش', 1, NULL, 68, 0, 0, 1000, 70)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'RoleApi/PutEntity#Core/RoleApi/PutEntity', N'ویرایش نقش', 1, NULL, 68, 0, 0, 1000, 71)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'RoleApi/DeleteEntity#Core/RoleApi/DeleteEntity', N'حذف نقش', 1, NULL, 68, 0, 0, 1000, 72)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'UserApi/GetEntities#Core/UserApi/GetEntities', N'مشاهده کاربران', 1, NULL, 67, 0, 0, 1000, 73)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'UserApi/PostEntity#Core/UserApi/PostEntity', N'تعریف کاربران', 1, NULL, 67, 0, 0, 1000, 74)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'UserApi/DeleteEntity#Core/UserApi/DeleteEntity', N'حذف کاربران ', 1, NULL, 67, 0, 0, 1000, 77)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'MenuViewElementRole#Core/ViewElementRole/Index', N'تعیین سطح دسترسی', 0, NULL, 3, 0, 0, 1000, 78)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/ViewElementRole/PostEntity#Core/ViewElementRole/PostEntity', N'تعریف سطح دسترسی', 2, NULL, 78, 0, 0, 1000, 80)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'MenuCompanyChart#Core/CompanyChart/Index', N'ساختار سازمانی', 0, NULL, 3, 0, 0, 1000, 83)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'CompanyChartApi/PostEntity#Core/CompanyChartApi/PostEntity', N'تعریف  ساختار سازمانی', 1, NULL, 83, 0, 0, 1000, 85)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'CompanyChartApi/GetEntity#Core/CompanyChartApi/GetEntity', N'مشاهده ساختار سازمانی', 1, NULL, 83, 0, 0, 1000, 86)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/ViewElementRole/Read#Core/ViewElementRole/Read', N'مشاهده ViewElementRole', 1, NULL, 78, 0, 0, 1000, 87)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'CompanyChartApi/GetEntities#Core/CompanyChartApi/GetEntities', N'مشاهده ساختار سازمانی', 1, NULL, 83, 0, 0, 1000, 138)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'UserRoleApi/GetEntities#Core/UserRoleApi/GetEntities', N'مشاهده نقش های کاربر', 1, NULL, 67, 0, 0, 1000, 140)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'UserRoleApi/PostEntity#Core/UserRoleApi/PostEntity', N'اختصاص نقش به کاربر', 1, NULL, 67, 0, 0, 1000, 141)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'UserRoleApi/PutEntity#Core/UserRoleApi/PutEntity', N'ویرایش نقش کاربر', 1, NULL, 67, 0, 0, 1000, 142)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'UserRoleApi/DeleteEntity#Core/UserRoleApi/DeleteEntity', N'حذف نقش کاربر', 1, NULL, 67, 0, 0, 1000, 143)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'UserApi/PutEntity#Core/UserApi/PutEntity', N'ویرایش کاربران', 1, NULL, 67, 0, 0, 1000, 200)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'CompanyChartApi/DeleteEntity#Core/CompanyChartApi/DeleteEntity', N'حذف ساختار سازمانی', 1, NULL, 83, 0, 0, 1000, 201)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/CompanyChart/Read#Core/CompanyChart/Read', N'مشاهده ساختار سازمانی', 1, NULL, 142, 1, 0, 1000, 235)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'MenuCoreSystemManagement#', N'پنل مدیریتی', 0, NULL, NULL, 0, 0, 5, 423)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'MenuCompany#Core/Company/Index', N'سازمان ها', 0, NULL, 423, 0, 0, 1000, 424)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'CompanyApi/GetEntities#Core/CompanyApi/GetEntities', N'مشاهده سازمان', 1, NULL, 424, 0, 0, 1000, 425)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'CompanyApi/PostEntity#Core/CompanyApi/PostEntity', N'تعریف سازمان', 1, NULL, 424, 0, 0, 1000, 426)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'CompanyApi/PutEntity#Core/CompanyApi/PutEntity', N'ویرایش سازمان', 1, NULL, 424, 0, 0, 1000, 427)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'CompanyApi/DeleteEntity#Core/CompanyApi/DeleteEntity', N'حذف سازمان', 1, NULL, 424, 0, 0, 1000, 428)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'MenuViewElement#Core/ViewElement/Index', N'المنت های صفحه', 0, NULL, 423, 0, 0, 1000, 430)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/ViewElement/GetEntities#Core/ViewElement/GetEntities', N'دریافت المنت های صفحه', 1, NULL, 430, 0, 0, 1000, 431)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/ViewElement/Index#Core/ViewElement/Index', N'شاخص المنت های صفحه', 1, NULL, 430, 1, 0, 1000, 432)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'EditSelectedViewElementMenuNode#Core/ViewElement/LoadSelectedViewElementMenu', N'ویرایش منو', 1, NULL, 430, 0, 0, 1000, 434)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/ViewElement/DeleteEntity#Core/ViewElement/DeleteEntity', N'حذف ویوالمنت', 1, NULL, 430, 0, 0, 1000, 435)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'MenuCompanyRole#Core/CompanyRole/Index', N'اختصاص نقش به سازمان', 0, NULL, 423, 0, 0, 1000, 465)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'CompanyRoleApi/GetEntities#Core/CompanyRoleApi/GetEntities', N'مشاهده نقشهای اختصاص یافته به سازمان', 1, NULL, 465, 0, 0, 1000, 467)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'CompanyRoleApi/PostEntity#Core/CompanyRoleApi/PostEntity', N'ایجاد نقش برای سازمان', 1, NULL, 465, 0, 0, 1000, 468)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'CompanyRoleApi/PutEntity#Core/CompanyRoleApi/PutEntity', N'ویرایش نقش سازمان', 1, NULL, 465, 0, 0, 1000, 469)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'CompanyRoleApi/DeleteEntity#Core/CompanyRoleApi/DeleteEntity', N'حذف نقش سازمان', 1, NULL, 465, 0, 0, 1000, 470)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'CompanyChartApi/PutEntity#Core/CompanyChartApi/PutEntity', N'ویرایش ساختار سازمانی', 1, NULL, 83, 0, 0, 1000, 610)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'MenuChangeUserPassword#Core/Account/ChangeUserPassword', N'تغییر کلمه عبور کاربر', 0, NULL, 3, 0, 0, 1000, 620)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'ChangeUserPasswordApi/PutEntity#Core/ChangeUserPasswordApi/PutEntity', N'ویرایش کلمه عبور کاربران', 1, NULL, 620, 0, 0, 1000, 623)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'MenuCoreFacilities#', N'امکانات', 0, NULL, NULL, 0, 0, 6, 657)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/User/Index#Core/User/Index', N'شاخص کاربران ', 1, NULL, 67, 0, 0, 1000, 1218)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/Role/Index#Core/Role/Index', N'شاخص صفحه نقش', 1, NULL, 68, 0, 0, 1000, 1220)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/ViewElementRole/Index#Core/ViewElementRole/Index', N'شاخص سطوح دسترسی نقش ها', 1, NULL, 78, 0, 0, 1000, 1222)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/CompanyChart/Index#Core/CompanyChart/Index', N'شاخص ساختار سازمانی', 1, NULL, 83, 0, 0, 1000, 1225)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/Company/Index#Core/Company/Index', N'شاخص شرکت ها', 1, NULL, 424, 0, 0, 1000, 1226)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/CompanyRole/Index#Core/CompanyRole/Index', N'شاخص نقش های سازمان', 1, NULL, 465, 0, 0, 1000, 1230)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/Account/ChangeUserPassword#Core/Account/ChangeUserPassword', N'تغییر پسورد', 1, NULL, 620, 0, 0, 1000, 1232)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/ExceptionLog/Index#Core/ExceptionLog/Index', N'شاخص ExceptionLog', 1, NULL, NULL, 0, 0, 1000, 1234)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'#/CoreCloseAll', N'بستن تمام تب ها', 0, NULL, 657, 0, 0, 1000, 1553)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'#/CoreAboutUs', N'درباره ما', 0, NULL, 657, 0, 0, 1000, 1554)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/partialviews/index#Core/partialviews/index', N'دریافت PartialView ', 1, NULL, NULL, 0, 0, 1000, 2499)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'CoreLoginViewElements#', N'ورود به سیستم Core', 1, NULL, NULL, 0, 0, 1000, 2533)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/Account/LogOn#Core/Account/LogOn', N'شاخص ورود به سیستم', 1, NULL, 2533, 0, 0, 1000, 2534)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'AccountApi/PostEntity#Core/AccountApi/PostEntity', N'ورود به سیستم', 1, NULL, 2533, 0, 0, 1000, 2537)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'MenuCoreViewElements#', N'منو', 1, NULL, NULL, 0, 0, 1000, 2539)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Menu#/areas/core/views/partialviews/DirectiveTemplates/menu.cshtml', N'تمپلیت دیرکتیو منو', 3, NULL, 2539, 0, 0, 1000, 2540)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Notification#/areas/core/views/partialviews/DirectiveTemplates/Notification.cshtml', N'تمپلیت دیرکتیو پیغام ها', 3, NULL, 2533, 0, 0, 1000, 2542)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'ViewElementApi/GetMenuItems#Core/ViewElementApi/GetMenuItems', N'دریافت لیست منو ها', 1, NULL, 2539, 0, 0, 1000, 2544)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'CoreGridLookUpTreeViewElements#', N'گرید لوکاپ درخت', 1, NULL, NULL, 0, 0, 1000, 2548)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/Template/UploadTreeLookup#Core/Template/UploadTreeLookup', N'بارگذاری صفحات درخت', 1, NULL, 2548, 0, 0, 1000, 2549)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/Template/UploadGridLookup#Core/Template/UploadGridLookup', N'بارگذاری صفحات گرید', 1, NULL, 2548, 0, 0, 1000, 2550)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/Template/GetGridViewTemplate#Core/Template/GetGridViewTemplate', N'دریافت تمپلیت گرید', 1, NULL, 2548, 0, 0, 1000, 2551)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/Template/Get#Core/Template/Get', N'دریافت تمپلیت', 1, NULL, 2548, 0, 0, 1000, 2552)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/Template/Show#Core/Template/Show', N'نمایش تمپلیت', 1, NULL, 2548, 0, 0, 1000, 2553)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/Template/GetLookupTemplate#Core/Template/GetLookupTemplate', N'دریافت تمپلیت لوکاپ', 1, NULL, 2548, 0, 0, 1000, 2554)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/Template/GetGridTotalConfigurationOptions#Core/Template/GetGridTotalConfigurationOptions', N'دریافت اطلاعات گرید', 1, NULL, 2548, 0, 0, 1000, 2555)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/Template/CreateHelpView#Core/Template/CreateHelpView', N'راهنما', 1, NULL, 2548, 0, 0, 1000, 2556)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'/areas/Core/Views/Lookup/LookupTemplate.cshtml#/areas/Core/Views/Lookup/LookupTemplate.cshtml', N'صفحه تمپلیت لوکاپ', 3, NULL, 2548, 0, 0, 1000, 2557)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/ViewElement/PostEntity#Core/ViewElement/PostEntity', N'ثبت ویوالمنت جدید', 1, NULL, 430, 0, 0, 1000, 2568)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/ViewElement/PutEntity#Core/ViewElement/PutEntity', N'ویرایش ویوالمنت', 1, NULL, 430, 0, 0, 1000, 2569)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'AccountApi/GetUserHassAccess#Core/AccountApi/GetUserHassAccess', N'دریافت دسترسی های کاربر', 1, NULL, 2539, 0, 0, 1000, 2570)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Captcha#/areas/core/views/partialviews/DirectiveTemplates/Captcha.cshtml', N'تمپلیت دیرکتیو کد امنیتی', 3, NULL, 2533, 0, 0, 1000, 2574)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'CaptchaApi/GetCaptchaImage#Core/CaptchaApi/GetCaptchaImag', N'دریافت تصویر کد امنیتی ', 1, NULL, 2533, 0, 0, 1000, 2575)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/ViewElement/GetNewViewElementId#Core/ViewElement/GetNewViewElementId', N'پیشنهاد ایدی برای ویوالمنت ', 1, NULL, 430, 0, 0, 1000, 2576)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'DateInfoApi/GetTodaysShamsiDate#Core/DateInfoApi/GetTodaysShamsiDate', N'دریافت تاریخ شمسی امروز', 1, NULL, NULL, 0, 0, 1000, 2577)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'SepehrView#/areas/core/views/partialviews/DirectiveTemplates/SepehrView.cshtml', N'تمپلیت کانتینر ویو', 3, NULL, 2533, 0, 0, 1000, 2578)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'ViewElementApi/GetAccessibleViewElements#Core/ViewElementApi/GetAccessibleViewElements', N'دریافت لیست ایتم های قابل دسترس کاربر', 1, NULL, 2539, 0, 0, 1000, 2579)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'ConstantsAPi/GetConstantByNameOfCategory#Core/ConstantsAPi/GetConstantByNameOfCategory', N'دریافت لیست consstant category', 1, NULL, 2539, 0, 0, 1000, 2580)

-- CacheInfo management view elements
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'CacheInfo#Core/CacheInfoManagement/Index', N'مقادیر CacheInfo', 0, NULL, 423, 0, 0, 0, 2581)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/CacheInfoManagement/Index#Core/CacheInfoManagement/Index', N'شاخص مقادیر CacheInfo', 1, NULL, 2581, 0, 0, 0, 2582)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'CacheInfoApi/GetEntities#core/CacheInfoApi/GetEntities', N'ليست مقادیر CacheInfo ', 1, NULL, 2581, 0, 0, 0, 2583)

INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Error#Core/SepehrError/NotFound', N'خطا', 1, NULL, null, 0, 0, 0, 2584)

INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/SepehrError/NotFound#Core/SepehrError/NotFound', N'خطا', 1, NULL, null, 0, 0, 0, 2585)
INSERT [core].[ViewElements]([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/CompanyViewElement/PostEntity#Core/CompanyViewElement/PostEntity', N'ثبت سطح دسترسی', 2, NULL, 78, 0, 0, 1000, 2586)

INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'GridHistory#Core/GridHistory/Index', N' لاگ گرید', 1, NULL, null, 0, 0, 0, 2600)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'Core/GridHistory/Index#Core/GridHistory/Index', N'شاخص لاگ گرید', 1, NULL, null, 0, 0, 0, 2601)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'GridHistoryApi/GetGridHistory#Core/GridHistoryApi/GetGridHistory', N'دریافت لاگ های کاربر', 1, NULL, null, 0, 0, 1000, 2606)
INSERT [core].[ViewElements] ([UniqueName], [Title], [ElementType], [XMLViewData], [ParentId], [IsHidden], [InVisible], [SortOrder], [Id]) VALUES (N'DateInfoApi/GetTodaysMiladiDate#Core/DateInfoApi/GetTodaysMiladiDate', N'دریافت تاریخ میلادی امروز', 1, NULL, NULL, 0, 0, 1000, 2607)







/****** Object:  Table [core].[ViewElementRoles]    Script Date: 05/23/2016 17:11:24 ******/
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (3, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (11, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (67, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (68, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (69, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (70, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (71, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (72, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (73, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (74, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (77, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (78, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (80, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (83, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (85, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (86, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (87, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (138, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (140, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (141, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (142, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (143, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (201, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (235, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (423, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (424, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (425, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (426, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (427, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (428, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (430, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (431, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (432, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (434, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (435, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (465, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (467, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (468, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (469, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (470, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (620, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (623, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (657, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (1218, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (1220, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (1222, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (1225, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (1226, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (1230, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (1232, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (1234, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (1553, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (1554, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2568, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2569, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (11, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (14, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (15, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (26, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2499, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2533, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2534, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2537, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2539, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2540, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2542, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2544, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2548, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2549, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2550, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2551, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2552, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2553, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2554, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2555, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2556, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2557, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2570, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2574, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2575, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2577, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2578, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2579, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2580, 2)

-- CacheInfo management view elements
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2581, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2582, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2583, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2584, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2585, 2)

INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2586, 1)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2600, 2)

INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2601, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2606, 2)
INSERT [core].[ViewElementRoles] ([ViewElementId], [RoleId]) VALUES (2607, 2)






END


END TRY
BEGIN CATCH
    SELECT 
        ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;

IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
GO