﻿DECLARE @CurrentMigration [nvarchar](max)

IF object_id('[dbo].[__MigrationHistory]') IS NOT NULL
    SELECT @CurrentMigration =
        (SELECT TOP (1) 
        [Project1].[MigrationId] AS [MigrationId]
        FROM ( SELECT 
        [Extent1].[MigrationId] AS [MigrationId]
        FROM [dbo].[__MigrationHistory] AS [Extent1]
        WHERE [Extent1].[ContextKey] = N'Core.Ef.Migrations.Configuration'
        )  AS [Project1]
        ORDER BY [Project1].[MigrationId] DESC)

IF object_id('[core].[__MigrationHistory]') IS NOT NULL
    SELECT @CurrentMigration =
        (SELECT TOP (1) 
        [Project1].[MigrationId] AS [MigrationId]
        FROM ( SELECT 
        [Extent1].[MigrationId] AS [MigrationId]
        FROM [core].[__MigrationHistory] AS [Extent1]
        WHERE [Extent1].[ContextKey] = N'Core.Ef.Migrations.Configuration'
        )  AS [Project1]
        ORDER BY [Project1].[MigrationId] DESC)

IF @CurrentMigration IS NULL
    SET @CurrentMigration = '0'

IF @CurrentMigration < '201503101253518_Core_Ver2'
BEGIN
    ALTER TABLE [core].[Logs] ADD [LogType] [nvarchar](max)
    IF schema_id('core') IS NULL
        EXECUTE('CREATE SCHEMA [core]')
    CREATE TABLE [core].[__MigrationHistory] (
        [MigrationId] [nvarchar](150) NOT NULL,
        [ContextKey] [nvarchar](300) NOT NULL,
        [Model] [varbinary](max) NOT NULL,
        [ProductVersion] [nvarchar](32) NOT NULL,
        CONSTRAINT [PK_core.__MigrationHistory] PRIMARY KEY ([MigrationId], [ContextKey])
    )
    INSERT [core].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
    VALUES (N'201503101253518_Core_Ver2', N'Core.Ef.Migrations.Configuration',  0x1F8B0800000000000400ED5ADD6EDB3614BE1FB0771074B50DA995B4375D60B7689D6430D6FC204E8BDD158C443B44295225A9CCC6B027DBC51E69AFB04359922952B2293BC9DA620802D8FCF9CE0FCF393C87C7FFFCF5F7F0F522A5C13D169270360A8F0687618059CC13C2E6A33057B3672FC3D7AFBEFF6E789AA48BE043B5EE855E073B991C85774A65C75124E33B9C223948492CB8E4333588791AA18447CF0F0F7F8E8E8E220C10216005C1F03A678AA4B8F8025FC79CC5385339A2E73CC15496E330332D50830B946299A1188FC2311778703A0B83379420203FC514BE20C6B8420A983B7E2FF15409CEE6D30C0610BD596618D6CD1095B864FA78BDDC97FFC3E79AFF68BDB1828A73A978DA13F0E845A990C8DEBE935AC35A61A0B25350AD5A6AA90BB58DC2D385562E60BFE3F330B0091E8FA9D08B2BCD16BB07E69E83C09839A88D006C45FFC16C4E552EF088E15C09440F82ABFC9692F857BCBCE19F301BB19C529343E011E61A033074257886855A5EE359C9F7E4240CA2E6BEC8DE586F33F6ACA4F9252749185C006D744B717DFE86E0530562FD82191648E1E40A2985051CDF24C185A40E718B54AD224DAFA20A96079E1306E768F10EB3B9BA1B85F0310CCEC80227D548C9CA7B46C0D160931239DE46ED1C4B89E68F4F67AA50FCE94680AB3D3E299E8B272073038106A44AB38AD25BC29080E3D551271702C2DDF2BC402B48353878D94E7F07AB1AF334CB9586B7B8BD40F7645E6CB54D9901466D6461708D69B14CDE916C15F61A5EFAD15E7F26787ACDA91500AC651FEB43E0DBD7DE2031C7AA29C1305AC79B8D51A847F0F93FE6749182BB4D4C9247779971714C4F1572C60283324EE0BF22A53F6BB76DD1E566A8A6C18E39A41915E684A917CF7B0382293E4978FF5A835433B76809513A8C3417ADE3923DE7042367419F08F4464A1E93829F1666ED70D994F79425418FD8B9B20D3B22C32141942219C425606F14FEE4A8D58F4C25B42799C3C1E0C8D690A18BCD2A728EAB8BE1EEB35B73D953079DA7FDF082AF2C067C4B2102BAAE021138C5C9AD1EC50BD5725941F42DEF2B597AB52D8A469D62D5626F320CD666DA2A8CA39726580746DB5643E876669C5CC1D8E1915AD8D7683F6FA905731414ED065C99892F70C32A60B987F2DC28E66A6CB3EBF8398F21C2569574BACB03E8A18AA9B587AC2BF268559257A57BD451BB0FCF5196C15D69D4F2E548302D0BF967D3FEC56EBAC28862D952F3D6DCD694E09A830CC69AD58E9EE03322A4824403DD227D398E93B46599190F3ADCB3A2D5E6F2EEE155DE5BEDD29FD7C167706A05050B60ADC433902B859CB11011779CB8BBBD7851411489961476CC699EB2AE3478D36EAB123681AC297FCC3AF934D1EA417F1CB39E35A1CCF11E68A59F3690CA317F1423D933818C61176B1859276FDB56E41897E5ECB6C57AD9F3CE66BC9BF53EA1D156A59489508DF9A358959209664DF5C034EAA106A031EE8FD65A1235D4D6B6C01FBFAE904CCC7AF0EB768AE6FDD81DE99D7C6A73587796F709E23A03D85084752447AEEAFC5CAA09D6E6615A873543FBF15A46D25D79EDCB1C5CEC09296A9F89D4C5725D28F7D2809D45F5362437B76C8DA6D61A8FC8D9A2FDAE9C714795370F737FE3E8CA8BBF288BD822F4767B70926B7B491DD6EA24DB4AA6876562EBD32DB332DDD592300015DC934467B9D3A554381DE80583E9673AA604EB1BA05A708E189961A956EFAA2124E22FADDEDB97D3078BA44C688F66D8933F10E78C7CCE31295E7B67048BD28F373D08F77CB06CED4AB17B24E23B247E48D1E247137287CED35E586E77693FB8C69BD35E50CE03ACE0BF976DF1CE435A3F97EEF54CFD71937D388F501396E0C528FCA3803A0E26BFD9B7E8E4E420B814E0B9C7C161F0E7663DF4EADE7C83DED2ECA7EC6540AD3D93FD109DBE48029FD503F74588FEB85F57E4EB713CE7EEDEC3ED2CACFD9DEEE11B167B3C9D7762AEEEFC9D5B1E101BB0D07A4614F21FA90464404ED97625088B4986689B4C6E32E81377B4DA6B587BE6046798E9D3EF92D78BA64FAD5453B282E236B53C460BE7312CC586FA766CC2978C474DF4E046D0D5CEB25FB9FDDB555BBB55AB3A6214C610A0E1C457B16E73BBA1A5A3D5D5D06A456F05FD327A5D9D4D17EFA6D62AAC7AA2FCF71DACFD85B737F613B34783CAAD95C1D38CDF9F82A74B325F43E8570086E3868FD56B266CC62B9FB738AA9638E5934290B7A13702720B142B988E21492C7E46F201D15C2B33BDC5C9845DE60AB21A1019A7B7B4F153201D3236D12FBA704D9E8797C529C8871001D8243AF5BC646F7342939AEF3337E5EA82D0B1A8CCE3F4592A9DCFCD9735D205679E40A5FAEA107A83D38C0298BC6453748F77E10D8A8077788EE265F5E4D10DB2FD209A6A1F9E103417289525C67A3F7C051B4ED2C5AB7F01FD8511C5862D0000 , N'6.1.1-30610')
END
