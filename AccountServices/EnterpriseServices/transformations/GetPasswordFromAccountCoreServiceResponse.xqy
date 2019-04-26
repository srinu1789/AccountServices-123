xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getPasswordResponse1" element="ns3:getPasswordResponse" location="../../CoreServices/xsd/AccountCoreServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:forgotPasswordResponse" location="../xsd/AccountServices.xsd" ::)

declare namespace ns2 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns1 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns3 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/GetPasswordFromAccountCoreServiceResponse/";

declare function xf:GetPasswordFromAccountCoreServiceResponse($getPasswordResponse1 as element(ns3:getPasswordResponse))
    as element(ns2:forgotPasswordResponse) {
        <ns2:forgotPasswordResponse>
            <ns0:requestToken>{ $getPasswordResponse1/ns0:requestToken/@* , $getPasswordResponse1/ns0:requestToken/node() }</ns0:requestToken>
            <ns0:result>{ $getPasswordResponse1/ns0:result/@* , $getPasswordResponse1/ns0:result/node() }</ns0:result>
            <ns0:serverTransactionId>{ data($getPasswordResponse1/ns0:serverTransactionId) }</ns0:serverTransactionId>
        </ns2:forgotPasswordResponse>
};

declare variable $getPasswordResponse1 as element(ns3:getPasswordResponse) external;

xf:GetPasswordFromAccountCoreServiceResponse($getPasswordResponse1)