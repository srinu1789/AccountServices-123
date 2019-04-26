xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.tracfone.com/AccountCoreServices";
(:: import schema at "../xsd/AccountCoreServices.xsd" ::)

declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare variable $getHPPSummaryRequest as element() (:: schema-element(ns1:getHPPSummaryRequest) ::) external;

declare function local:func($getHPPSummaryRequest as element() (:: schema-element(ns1:getHPPSummaryRequest) ::)) {
    <INPUT TASK="getHppSummary">
        <SOURCE_SYSTEM>{fn:data($getHPPSummaryRequest/ns0:sourceSystem)}</SOURCE_SYSTEM>
        <BRAND_NAME>{fn:data($getHPPSummaryRequest/ns0:brandName)}</BRAND_NAME>
        <ESN>{fn:data($getHPPSummaryRequest/ns1:esn)}</ESN>
    </INPUT>
};

local:func($getHPPSummaryRequest)
