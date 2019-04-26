xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns3="http://b2b.tracfone.com/AccountServices";
(:: import schema at "../xsd/AccountServices.xsd" ::)
declare namespace ns4="http://www.tracfone.com/AccountCoreServices";
(:: import schema at "../../CoreServices/xsd/AccountCoreServices.xsd" ::)

declare namespace functx = "http://www.functx.com";
declare namespace ns1 = "http://www.tracfone.com/CommonTypes";
declare namespace ns0 = "http://www.tracfone.com/PhoneCommonTypes";

declare function functx:total-days-from-duration
  ( $date1 as xs:date?,$date2 as xs:date?)  as xs:decimal? {

   ($date1 - $date2) div xs:dayTimeDuration('P1D')
 } ;
 
 declare function functx:usDateFormat
  ( $strDate as xs:string?)  as xs:date? {
    xs:date(concat(substring($strDate,7,4),
                  '-',
                  substring($strDate,1,2),
                  '-',
                  substring($strDate,4,2)
                 )
          )
   
 } ;
 
 declare function functx:canActivate
  ( $noOfDays as xs:decimal?)  as xs:string? {       
    if ($noOfDays >= 60)
    then 'N'
    else 'Y'
   
 } ;
 
 declare function functx:calcDatesDifference
  ( $strDeactDate as xs:string?)  as xs:string? {
  
   let $deActDate :=  functx:usDateFormat($strDeactDate)
   
   let $currentDate := fn:current-date()
   
   let $noOfDays :=functx:total-days-from-duration($currentDate,$deActDate)
      
   return functx:canActivate($noOfDays)
   
 } ;

declare variable $getAccountDetailsResponse1 as element() (:: schema-element(ns4:getAccountDetailsResponse) ::) external;

declare function local:CoreServicesToGetAccountDetailsResponse($getAccountDetailsResponse1 as element() (:: schema-element(ns4:getAccountDetailsResponse) ::)) as element() (:: schema-element(ns3:getAccountDetailsResponse) ::) {
            <ns3:getAccountDetailsResponse>
            <ns1:result>
                <ns1:code>{ data($getAccountDetailsResponse1/ns1:result/ns1:code) }</ns1:code>
                <ns1:message>{ data($getAccountDetailsResponse1/ns1:result/ns1:message) }</ns1:message>
            </ns1:result>
            <ns1:serverTransactionId>{ data($getAccountDetailsResponse1/ns1:serverTransactionId) }</ns1:serverTransactionId>
            <ns3:deviceCount>{ data($getAccountDetailsResponse1/ns4:deviceCount) }</ns3:deviceCount>
            {
                for $deviceWithAccount in $getAccountDetailsResponse1/ns4:deviceWithAccount
                return
                    <ns3:deviceWithAccount>
                        <ns0:min>{ data($deviceWithAccount/ns0:min) }</ns0:min>
                        <ns0:esn>{ data($deviceWithAccount/ns0:esn) }</ns0:esn>
                        <ns0:nickName>{ data($deviceWithAccount/ns0:nickName) }</ns0:nickName>
                        <ns0:handsetStatus>
                            <ns0:statusCode>{ data($deviceWithAccount/ns0:handsetStatus/ns0:statusCode) }</ns0:statusCode>
                            <ns0:statusName>{ data($deviceWithAccount/ns0:handsetStatus/ns0:statusName) }</ns0:statusName>
                        </ns0:handsetStatus>
                        <ns0:servicePlanName>{ data($deviceWithAccount/ns0:servicePlanName) }</ns0:servicePlanName>
                        <ns0:servicePlanId>{ data($deviceWithAccount/ns0:servicePlanId) }</ns0:servicePlanId>
                        {
                            if (string-length(string($deviceWithAccount/ns0:serviceEndDate))>0.0) then
                                <ns0:serviceEndDate>{ concat(substring(string($deviceWithAccount/ns0:serviceEndDate), 7, 4),'-', substring(string($deviceWithAccount/ns0:serviceEndDate), 1, 2),'-', substring(string($deviceWithAccount/ns0:serviceEndDate), 4, 2)) }</ns0:serviceEndDate>
                            else
                                <ns0:serviceEndDate></ns0:serviceEndDate>
                        }
                        <ns0:autoRefillStatus>{ data($deviceWithAccount/ns0:autoRefillStatus) }</ns0:autoRefillStatus>
                        <ns0:reserveCount>{ data($deviceWithAccount/ns0:reserveCount) }</ns0:reserveCount>
                        <ns0:defaultDevice>{ data($deviceWithAccount/ns0:defaultDevice) }</ns0:defaultDevice>
                        <ns0:partClass>{ data($deviceWithAccount/ns0:partClass) }</ns0:partClass>
                        <ns0:deviceType>{ data($deviceWithAccount/ns0:deviceType) }</ns0:deviceType>
                        <ns0:phoneTechnology>{ data($deviceWithAccount/ns0:phoneTechnology) }</ns0:phoneTechnology>
                        <ns0:deactivationDate>{ data($deviceWithAccount/ns0:deactivationDate) }</ns0:deactivationDate>
                        {
                        if (string-length(string($deviceWithAccount/ns0:deactivationDate))>0) then
                        <ns0:canReactivate>
                            {functx:calcDatesDifference($deviceWithAccount/ns0:deactivationDate/text())}
                        </ns0:canReactivate>                       
                        else
                             <ns0:canReactivate></ns0:canReactivate> 
                        }
                       
                    </ns3:deviceWithAccount>
            }
        </ns3:getAccountDetailsResponse>
};

local:CoreServicesToGetAccountDetailsResponse($getAccountDetailsResponse1)