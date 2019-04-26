xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$validateAccountRequest1" element="ns4:validateAccountRequest" location="../xsd/AccountCoreServices.xsd" ::)
(:: pragma bea:local-element-complex-return type="VerifyUserRequestType/INPUT" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns1 = "http://www.tracfone.com/CommonTypes";
declare namespace ns4 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns3 = "http://www.tracfone.com/SecurityCommonTypes";
declare namespace ns0 = "http://www.tracfone.com/PhoneCommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/ValidateAccount2CBORequest/";

declare function xf:ValidateAccount2CBORequest($validateAccountRequest1 as element(ns4:validateAccountRequest))
    as element() {
        <INPUT TASK = "verifyUser">
            <SOURCE_SYSTEM>{ data($validateAccountRequest1/ns1:sourceSystem) }</SOURCE_SYSTEM>
            <LANGUAGE>{ data($validateAccountRequest1/ns1:language) }</LANGUAGE>
            <EMAIL>{ data($validateAccountRequest1/ns4:accountCredentials/ns3:AccountCredentials/ns2:email) }</EMAIL>
            <BRAND_NAME>{ data($validateAccountRequest1/ns1:brandName) }</BRAND_NAME>
            <PASSWORD>{ data($validateAccountRequest1/ns4:accountCredentials/ns3:AccountCredentials/ns2:password) }</PASSWORD>
        </INPUT>
};

declare variable $validateAccountRequest1 as element(ns4:validateAccountRequest) external;

xf:ValidateAccount2CBORequest($validateAccountRequest1)