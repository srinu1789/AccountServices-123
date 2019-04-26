xquery version "2004-draft";
(:: pragma bea:local-element-complex-parameter parameter="$getAccountInformation1" type="GetAccountInformationResponseType/getAccountInformation" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)
(:: pragma bea:global-element-return element="ns3:getAccountDetailsResponse" location="../xsd/AccountCoreServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns1 = "http://www.tracfone.com/CommonTypes";
declare namespace ns3 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns0 = "http://www.tracfone.com/PhoneCommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/CBO2GetAccountDetailsResponse/";

declare function xf:CBO2GetAccountDetailsResponse($getAccountInformation1 as element())
as element(ns3:getAccountDetailsResponse) {
<ns3:getAccountDetailsResponse>
     <ns1:result>
     <ns1:code>{ data($getAccountInformation1/ERROR_NUM) }</ns1:code>
     <ns1:message>{ data($getAccountInformation1/ERROR_STRING) } </ns1:message>
     </ns1:result>
     <ns3:deviceCount>{ data($getAccountInformation1/ESN_COUNT) }</ns3:deviceCount>
    {           
    for $i in (1 to $getAccountInformation1/ESN_COUNT)
    let $j := $i - 1
    let $esn := concat('ESN',$j)
    let $min := concat('MIN',$j)
    let $nickname := concat('NICKNAME',$j)
    let $esnStatus := concat('ESN_STATUS',$j)
    let $esnStatusCode := concat('ESN_STATUS_NUMBER',$j)
    let $programName := concat('PROGRAM_NAME',$j,'_','0')
    let $servicePlanId := concat('SERVICE_PLAN_ID',$j)
    let $serviceEndDate := concat('ENROLLMENT_DATE',$j,'_','0')
    let $reserveCount := concat('NO_OF_RED_CARDS_IN_Q',$j)
    let $autoRefillStatus := concat('PROGRAM_IS_RECURRING',$j,'_','0')
    let $defaultDevice := concat('DEFAULT_FLAG',$j)
    let $devicePartClass  := concat('PART_CLASS',$j)
    let $deviceType  := concat('DEVICE_TYPE',$j)
    let $phoneTechonology  := concat('ESN_PHONE_TECHNOLOGY',$j)
    let $deactivationDate := concat('DEACTIVATION_DATE',$j)
    
    return
    
    <ns3:deviceWithAccount>
        <ns0:min>{ data($getAccountInformation1/*[local-name() eq $min]) }</ns0:min>
        <ns0:esn>{ data($getAccountInformation1/*[local-name() eq $esn]) }</ns0:esn>
        <ns0:nickName>{ data($getAccountInformation1/*[local-name() eq $nickname]) }</ns0:nickName>
        <ns0:handsetStatus>
            <ns0:statusCode>{ data($getAccountInformation1/*[local-name() eq $esnStatusCode]) }</ns0:statusCode>
            <ns0:statusName>{ data($getAccountInformation1/*[local-name() eq $esnStatus]) }</ns0:statusName>
        </ns0:handsetStatus>
        
        {
        if ($getAccountInformation1/*[local-name() eq $programName]/text() != 'null')
        then
        <ns0:servicePlanName>{ data($getAccountInformation1/*[local-name() eq $programName]) }</ns0:servicePlanName> 
        else
        <ns0:servicePlanName></ns0:servicePlanName>
        }
        
        {
        if ($getAccountInformation1/*[local-name() eq $servicePlanId]/text() != 'null')
        then
        <ns0:servicePlanId>{ xs:integer(data($getAccountInformation1/*[local-name() eq $servicePlanId]))}</ns0:servicePlanId> 
        else
        <ns0:servicePlanId> </ns0:servicePlanId>
        }
        {
        if(data($getAccountInformation1/*[local-name() eq $serviceEndDate])!= '')then
        <ns0:serviceEndDate>{ fn:replace(data($getAccountInformation1/*[local-name() eq $serviceEndDate]),'/','-' ) }</ns0:serviceEndDate> 
        else
        ()
        }
        {
        if ($getAccountInformation1/*[local-name() eq $autoRefillStatus])
        then
        <ns0:autoRefillStatus>{ xs:boolean(data($getAccountInformation1/*[local-name() eq $autoRefillStatus])) }</ns0:autoRefillStatus>
        else
        <ns0:autoRefillStatus>false</ns0:autoRefillStatus>
        }
        
        <ns0:reserveCount>{ data($getAccountInformation1/*[local-name() eq $reserveCount]) }</ns0:reserveCount>
        <ns0:defaultDevice>{ xs:boolean(data($getAccountInformation1/*[local-name() eq $defaultDevice]) )}</ns0:defaultDevice>
        <ns0:partClass>{ data($getAccountInformation1/*[local-name() eq $devicePartClass]) }</ns0:partClass>            
        <ns0:deviceType>{ data($getAccountInformation1/*[local-name() eq $deviceType]) }</ns0:deviceType>
        <ns0:phoneTechnology>{ data($getAccountInformation1/*[local-name() eq $phoneTechonology]) }</ns0:phoneTechnology>
         {
        if (
        $getAccountInformation1/*[local-name() eq $deactivationDate]/text() != 'null')
        then
        <ns0:deactivationDate>{ data($getAccountInformation1/*[local-name() eq $deactivationDate]) }</ns0:deactivationDate> 
        else
        <ns0:deactivationDate></ns0:deactivationDate>
        }
        
    </ns3:deviceWithAccount>
    }             
</ns3:getAccountDetailsResponse>

};
declare variable $getAccountInformation1 as element() external;

xf:CBO2GetAccountDetailsResponse($getAccountInformation1)