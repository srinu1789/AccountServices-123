xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getAccountInformationRequest1" element="ns1:getAccountInformationRequest" location="../xsd/AccountCoreServices.xsd" ::)
(:: pragma bea:local-element-complex-return type="GetAccountInformationRequestType/INPUT" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)

declare namespace ns1 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/GetAcctInfo2CBORequest/";

declare function xf:GetAcctInfo2CBORequest($getAccountInformationRequest1 as element(ns1:getAccountInformationRequest))
    as element() {
        <INPUT TASK = "getAccountInformation">
            <TECHNOLOGY>{ data($getAccountInformationRequest1/ns1:technology) }</TECHNOLOGY>
            <SOURCE_SYSTEM>{ data($getAccountInformationRequest1/ns0:sourceSystem) }</SOURCE_SYSTEM>
            <LANGUAGE>{ data($getAccountInformationRequest1/ns0:language) }</LANGUAGE>
            <EMAIL>{ data($getAccountInformationRequest1/ns1:email) }</EMAIL>
            <MYACCOUNT_ADD_ESN_VERIFICATION_ENABLED>false</MYACCOUNT_ADD_ESN_VERIFICATION_ENABLED>
            <OUTPUT_PARAMETER_NAME>dto_account_summary</OUTPUT_PARAMETER_NAME>
            <BRAND_NAME>{ data($getAccountInformationRequest1/ns0:brandName) }</BRAND_NAME>
        </INPUT>
};

declare variable $getAccountInformationRequest1 as element(ns1:getAccountInformationRequest) external;

xf:GetAcctInfo2CBORequest($getAccountInformationRequest1)