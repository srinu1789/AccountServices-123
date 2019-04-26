xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getCustomerProfileResponse1" element="ns5:getCustomerProfileResponse" location="../../SpringFarmServices/xsd/AccountSpringFarmServices.xsd" ::)
(:: pragma bea:global-element-return element="ns4:getAccountDetailsResponse" location="../xsd/AccountCoreServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns1 = "http://www.tracfone.com/CommonTypes";
declare namespace ns4 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns3 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns0 = "http://www.tracfone.com/PhoneCommonTypes";
declare namespace ns5 = "http://www.tracfone.com/AccountSpringFarmServices";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/GetCustomerProfile2GetAccountDetailsErrorResponse/";

declare function xf:GetCustomerProfile2GetAccountDetailsErrorResponse($getCustomerProfileResponse1 as element(ns5:getCustomerProfileResponse))
    as element(ns4:getAccountDetailsResponse) {
        <ns4:getAccountDetailsResponse>
            <ns1:requestToken>
                <ns1:clientTransactionId>{ data($getCustomerProfileResponse1/ns1:requestToken/ns1:clientTransactionId) }</ns1:clientTransactionId>
                <ns1:clientId>{ data($getCustomerProfileResponse1/ns1:requestToken/ns1:clientId) }</ns1:clientId>
            </ns1:requestToken>
            <ns1:result>
                <ns1:code>{ data($getCustomerProfileResponse1/ns1:result/ns1:code) }</ns1:code>
                <ns1:message>{ data($getCustomerProfileResponse1/ns1:result/ns1:message) }</ns1:message>
            </ns1:result>
            <ns1:serverTransactionId>{ data($getCustomerProfileResponse1/ns1:serverTransactionId) }</ns1:serverTransactionId>
        </ns4:getAccountDetailsResponse>
};

declare variable $getCustomerProfileResponse1 as element(ns5:getCustomerProfileResponse) external;

xf:GetCustomerProfile2GetAccountDetailsErrorResponse($getCustomerProfileResponse1)