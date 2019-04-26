xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getTransactionHistoryRequest1" element="ns2:getTransactionHistoryRequest" location="../xsd/AccountCoreServices.xsd" ::)
(:: pragma bea:local-element-complex-return type="GetPaymentHistoryRequestType/INPUT" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns1 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/GetTransactionHistory2CBORequest/";

declare function xf:GetTransactionHistory2CBORequest($getTransactionHistoryRequest1 as element(ns2:getTransactionHistoryRequest))
    as element() {
        <INPUT TASK="getPaymentHistory">
            <SOURCE_SYSTEM>{ data($getTransactionHistoryRequest1/ns0:sourceSystem) }</SOURCE_SYSTEM>
            <WEB_USER_ID>{ data($getTransactionHistoryRequest1/ns2:accountId/ns1:accountIdentifierValue) }</WEB_USER_ID>
            <BRAND_NAME>{ data($getTransactionHistoryRequest1/ns0:brandName) }</BRAND_NAME>
        </INPUT>
};

declare variable $getTransactionHistoryRequest1 as element(ns2:getTransactionHistoryRequest) external;

xf:GetTransactionHistory2CBORequest($getTransactionHistoryRequest1)