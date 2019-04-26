xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getAccountDetailsResponse1" element="ns4:getAccountDetailsResponse" location="../../../CoreServices/xsd/AccountCoreServices.xsd" ::)
(:: pragma bea:global-element-return element="ns3:getAccountDetailsResponse" location="../../xsd/MobileAccountServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns1 = "http://www.tracfone.com/CommonTypes";
declare namespace ns4 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns3 = "http://b2b.tracfone.com/MobileAccountServices";
declare namespace ns0 = "http://www.tracfone.com/PhoneCommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/Mobile/CoreServicesToGetAccountDetailsResponse/";

declare function xf:CoreServicesToGetAccountDetailsResponse($getAccountDetailsResponse1 as element(ns4:getAccountDetailsResponse))
    as element(ns3:getAccountDetailsResponse) {
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
                        <ns0:serviceEndDate>{ data($deviceWithAccount/ns0:serviceEndDate) }</ns0:serviceEndDate>
                        <ns0:autoRefillStatus>{ data($deviceWithAccount/ns0:autoRefillStatus) }</ns0:autoRefillStatus>
                        <ns0:reserveCount>{ data($deviceWithAccount/ns0:reserveCount) }</ns0:reserveCount>
                        <ns0:defaultDevice>{ data($deviceWithAccount/ns0:defaultDevice) }</ns0:defaultDevice>
                        <ns0:partClass>{ data($deviceWithAccount/ns0:partClass) }</ns0:partClass>
                    </ns3:deviceWithAccount>
            }
        </ns3:getAccountDetailsResponse>
};

declare variable $getAccountDetailsResponse1 as element(ns4:getAccountDetailsResponse) external;

xf:CoreServicesToGetAccountDetailsResponse($getAccountDetailsResponse1)