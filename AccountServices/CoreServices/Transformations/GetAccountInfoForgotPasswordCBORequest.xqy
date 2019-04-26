xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getAccountInfoFotGotPasswordRequest1" element="ns1:getAccountInfoFotGotPasswordRequest" location="../xsd/AccountCoreServices.xsd" ::)
(:: pragma bea:local-element-complex-return type="GetAccountInformationRequestType/INPUT" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)

declare namespace ns1 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/GetAccountInfoForgotPasswordCBORequest/";

declare function xf:GetAccountInfoForgotPasswordCBORequest($getAccountInfoFotGotPasswordRequest1 as element(ns1:getAccountInfoFotGotPasswordRequest))
    as element() {
        <INPUT  TASK = "getAccountInformation">
            <SOURCE_SYSTEM>{ data($getAccountInfoFotGotPasswordRequest1/ns0:sourceSystem) }</SOURCE_SYSTEM>
            <LANGUAGE>{ data($getAccountInfoFotGotPasswordRequest1/ns0:language) }</LANGUAGE>
            <EMAIL>{ data($getAccountInfoFotGotPasswordRequest1/ns1:email) }</EMAIL>
            <BRAND_NAME>{ data($getAccountInfoFotGotPasswordRequest1/ns0:brandName) }</BRAND_NAME>
        </INPUT>
};

declare variable $getAccountInfoFotGotPasswordRequest1 as element(ns1:getAccountInfoFotGotPasswordRequest) external;

xf:GetAccountInfoForgotPasswordCBORequest($getAccountInfoFotGotPasswordRequest1)