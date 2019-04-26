xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getAccountDetailsRequest1" element="ns2:getAccountDetailsRequest" location="../xsd/AccountCoreServices.xsd" ::)
(:: pragma bea:local-element-complex-return type="GetAccountInformationRequestType/INPUT" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns1 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/GetAccountDetails2CBORequest/";

declare function xf:GetAccountDetails2CBORequest($getAccountDetailsRequest1 as element(ns2:getAccountDetailsRequest),
    $EMAIL as xs:string)
    as element() {
        <INPUT TASK = "getAccountInformation">
            <SOURCE_SYSTEM>{ data($getAccountDetailsRequest1/ns0:sourceSystem) }</SOURCE_SYSTEM>
            <LANGUAGE>{ data($getAccountDetailsRequest1/ns0:language) }</LANGUAGE>
            <EMAIL>{ $EMAIL }</EMAIL>
            <BRAND_NAME>{ data($getAccountDetailsRequest1/ns0:brandName) }</BRAND_NAME>
        </INPUT>
};

declare variable $getAccountDetailsRequest1 as element(ns2:getAccountDetailsRequest) external;
declare variable $EMAIL as xs:string external;

xf:GetAccountDetails2CBORequest($getAccountDetailsRequest1,
    $EMAIL)