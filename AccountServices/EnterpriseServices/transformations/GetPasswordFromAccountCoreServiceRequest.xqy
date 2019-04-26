xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$forgotPasswordRequest1" element="ns2:forgotPasswordRequest" location="../xsd/AccountServices.xsd" ::)
(:: pragma bea:global-element-return element="ns1:getPasswordRequest" location="../../CoreServices/xsd/AccountCoreServices.xsd" ::)

declare namespace ns2 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns1 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/GetPasswordFromAccountCoreServiceRequest/";

declare function xf:GetPasswordFromAccountCoreServiceRequest($forgotPasswordRequest1 as element(ns2:forgotPasswordRequest))
    as element(ns1:getPasswordRequest) {
        <ns1:getPasswordRequest>
            <ns0:requestToken>{ $forgotPasswordRequest1/ns0:requestToken/@* , $forgotPasswordRequest1/ns0:requestToken/node() }</ns0:requestToken>
            <ns0:brandName>{ data($forgotPasswordRequest1/ns0:brandName) }</ns0:brandName>
            <ns0:sourceSystem>{ data($forgotPasswordRequest1/ns0:sourceSystem) }</ns0:sourceSystem>
            <ns1:email>{ data($forgotPasswordRequest1/ns2:emailID) }</ns1:email>
        </ns1:getPasswordRequest>
};

declare variable $forgotPasswordRequest1 as element(ns2:forgotPasswordRequest) external;

xf:GetPasswordFromAccountCoreServiceRequest($forgotPasswordRequest1)