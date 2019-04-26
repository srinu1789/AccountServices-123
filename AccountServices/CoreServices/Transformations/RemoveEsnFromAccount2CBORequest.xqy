xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$removeMultipleEsnToAccountRequest1" element="ns1:removeMultipleEsnToAccountRequest" location="../xsd/AccountCoreServices.xsd" ::)
(:: pragma bea:local-element-complex-return type="RemoveMulitpleEsnToAccountRequestType/INPUT" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)

declare namespace ns1 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/RemoveEsnFromAccount2CBORequest/";

declare function xf:RemoveEsnFromAccount2CBORequest($removeMultipleEsnToAccountRequest1 as element(ns1:removeMultipleEsnToAccountRequest))
    as element() {
        <INPUT TASK = "removeMulitpleEsnToAccount">
            <LANGUAGE>{ data($removeMultipleEsnToAccountRequest1/ns0:language) }</LANGUAGE>
            <CONTACT_OBJID>{ data($removeMultipleEsnToAccountRequest1/ns1:contactObjId) }</CONTACT_OBJID>
            <ESN_COUNT>1</ESN_COUNT>
            <ESN0>{ data($removeMultipleEsnToAccountRequest1/ns1:esn) }</ESN0>
            <NICKNAME0>{ data($removeMultipleEsnToAccountRequest1/ns1:nickName) }</NICKNAME0>
            <SOURCE_SYSTEM>{ data($removeMultipleEsnToAccountRequest1/ns0:sourceSystem) }</SOURCE_SYSTEM>
            <BRAND_NAME>{ data($removeMultipleEsnToAccountRequest1/ns0:brandName) }</BRAND_NAME>
            <BUSINESS_ACCOUNTID>{ data($removeMultipleEsnToAccountRequest1/ns1:businessAccountId) }</BUSINESS_ACCOUNTID>
        </INPUT>
};

declare variable $removeMultipleEsnToAccountRequest1 as element(ns1:removeMultipleEsnToAccountRequest) external;

xf:RemoveEsnFromAccount2CBORequest($removeMultipleEsnToAccountRequest1)