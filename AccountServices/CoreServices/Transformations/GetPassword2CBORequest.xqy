xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getPasswordRequest1" element="ns1:getPasswordRequest" location="../xsd/AccountCoreServices.xsd" ::)
(:: pragma bea:local-element-complex-return type="getPasswordRequestType/INPUT" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)

declare namespace ns1 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/GetPassword2CBORequest/";

declare function xf:GetPassword2CBORequest($getPasswordRequest1 as element(ns1:getPasswordRequest))
    as element() {
        <INPUT TASK = "getPassword">
            <E_MAIL>{ data($getPasswordRequest1/ns1:email) }</E_MAIL>
            <BRAND_NAME>{ data($getPasswordRequest1/ns0:brandName) }</BRAND_NAME>
            <SOURCE_SYSTEM>{ data($getPasswordRequest1/ns0:sourceSystem) }</SOURCE_SYSTEM>
        </INPUT>
};

declare variable $getPasswordRequest1 as element(ns1:getPasswordRequest) external;

xf:GetPassword2CBORequest($getPasswordRequest1)