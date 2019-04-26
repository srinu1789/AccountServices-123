xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getAccountInformationRequest1" element="ns1:getAccountInformationRequest" location="../xsd/AccountCoreServices.xsd" ::)
(:: pragma bea:local-element-complex-return type="RetrivePaymentSourceRequestType/INPUT" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)

declare namespace ns1 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/RetrivePaymentSource2CBORequest/";

declare function xf:RetrivePaymentSource2CBORequest($contactObjId as xs:string,
    $getAccountInformationRequest1 as element(ns1:getAccountInformationRequest))
    as element() {
        <INPUT TASK = "RetrivePaymentSource">
            <CONTACT_OBJID>{ $contactObjId }</CONTACT_OBJID>
            <SOURCE_SYSTEM>{ data($getAccountInformationRequest1/ns0:sourceSystem) }</SOURCE_SYSTEM>
            <OUTPUT_PARAMETER_NAME>payment_sources</OUTPUT_PARAMETER_NAME>
            <BRAND_NAME>{ data($getAccountInformationRequest1/ns0:brandName) }</BRAND_NAME>
        </INPUT>
};

declare variable $contactObjId as xs:string external;
declare variable $getAccountInformationRequest1 as element(ns1:getAccountInformationRequest) external;

xf:RetrivePaymentSource2CBORequest($contactObjId,
    $getAccountInformationRequest1)