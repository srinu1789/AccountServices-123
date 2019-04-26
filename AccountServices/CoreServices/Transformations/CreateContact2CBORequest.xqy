xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$createContactRequest1" element="ns1:createContactRequest" location="../xsd/AccountCoreServices.xsd" ::)
(:: pragma bea:local-element-complex-return type="CreateContactRequestType/INPUT" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)

declare namespace ns1 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/CreateContact2CBORequest/";

declare function xf:CreateContact2CBORequest($createContactRequest1 as element(ns1:createContactRequest))
    as element() {
        <INPUT TASK = "CreateContact">
            <FIRST_NAME>{ data($createContactRequest1/ns1:customerName/ns0:firstName) }</FIRST_NAME>
            <LAST_NAME>{ data($createContactRequest1/ns1:customerName/ns0:lastName) }</LAST_NAME>
            <PHONE>{ data($createContactRequest1/ns1:phoneNumber) }</PHONE>
            <ADDRESS1>{ data($createContactRequest1/ns1:address/ns0:streetAddress/ns0:line1) }</ADDRESS1>
            <ADDRESS2>{ data($createContactRequest1/ns1:address/ns0:streetAddress/ns0:line2) }</ADDRESS2>
            <CITY>{ data($createContactRequest1/ns1:address/ns0:city) }</CITY>
            <STATE>{ data($createContactRequest1/ns1:address/ns0:state) }</STATE>
            <ZIPCODE>{ data($createContactRequest1/ns1:zipcode) }</ZIPCODE>
            <EMAIL>{ data($createContactRequest1/ns1:email) }</EMAIL>
            <ESN>{ data($createContactRequest1/ns1:esn) }</ESN>
            <PROMO_CODE>{ data($createContactRequest1/ns1:promo) }</PROMO_CODE>
            <COUNTRY>{ data($createContactRequest1/ns1:country) }</COUNTRY>
            <HTML_OK>1</HTML_OK>
            <PIN>{ data($createContactRequest1/ns1:pin) }</PIN>
            <SOURCE_SYSTEM>{ data($createContactRequest1/ns0:sourceSystem) }</SOURCE_SYSTEM>
            <BRAND_NAME>{ data($createContactRequest1/ns0:brandName) }</BRAND_NAME>
            <BIRTH_DATE>{xs:string(data($createContactRequest1/ns1:dateOfBirth) )}</BIRTH_DATE>
            <LOG_LEVEL>8</LOG_LEVEL>
        </INPUT>
};

declare variable $createContactRequest1 as element(ns1:createContactRequest) external;

xf:CreateContact2CBORequest($createContactRequest1)