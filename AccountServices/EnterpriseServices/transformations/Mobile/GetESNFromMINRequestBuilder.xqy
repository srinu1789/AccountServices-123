xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns1:getESNFromMINRequest" location="../../../../PhoneServices/CoreServices/xsd/PhoneCoreServices.xsd" ::)

declare namespace ns1 = "http://www.tracfone.com/PhoneCoreServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/Mobile/GetESNFromMINRequestBuilder/";

declare function xf:GetESNFromMINRequestBuilder($MIN as xs:string)
    as element(ns1:getESNFromMINRequest) {
        <ns1:getESNFromMINRequest>
            <ns1:min>{ $MIN }</ns1:min>
        </ns1:getESNFromMINRequest>
};

declare variable $MIN as xs:string external;

xf:GetESNFromMINRequestBuilder($MIN)