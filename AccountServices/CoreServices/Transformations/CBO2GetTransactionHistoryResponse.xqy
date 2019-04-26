xquery version "2004-draft";
(:: pragma bea:local-element-complex-parameter parameter="$getPaymentHistory1" type="GetPaymentHistoryResponseType/getPaymentHistory" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)
(:: pragma bea:global-element-return element="ns4:getTransactionHistoryResponse" location="../xsd/AccountCoreServices.xsd" ::)

declare namespace ns5 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns2 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns4 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns3 = "http://www.tracfone.com/SecurityCommonTypes";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/CBO2GetTransactionHistoryResponse/";

declare function xf:CBO2GetTransactionHistoryResponse($getPaymentHistory1 as element())
    as element(ns4:getTransactionHistoryResponse) {
        <ns4:getTransactionHistoryResponse>
            {
        if(data($getPaymentHistory1/TRANSCATION_COUNT) >0)
        then
        <ns0:result>
                <ns0:code>0</ns0:code>
                <ns0:message>Success</ns0:message>
          </ns0:result>
          else
        <ns0:result>
                <ns0:code>11900</ns0:code>
                <ns0:message>Transaction History could not be found</ns0:message>
          </ns0:result>
         }
            <ns4:totalTransactions>{xs:int(data($getPaymentHistory1/TRANSCATION_COUNT))} </ns4:totalTransactions>
             <ns4:transactionList>
            {           
                for $i in (1 to $getPaymentHistory1/TRANSCATION_COUNT)
                                let $j := $i - 1
                                let $transactionDate := concat('TRANSCATION_DATE_',$j)
                                let $transactionType := concat('TRANSACTION_DESCRIPTION_',$j,'_','0')
                                let $transactionTotal := concat('TOTAL_CHARGE_',$j)
                                let $discountTotal := concat('TOTAL_DISC_',$j)
                                let $transactionId := concat('TRANSCATION_ID_',$j)
                                let $transactionStatus := concat('PAYMENT_STATUS_',$j)
                                let $paymentSourceNumberMask := concat('PAYMENT_SOURCE_',$j)
                                let $paymentSourceType := concat('PAYMENT_SOURCE_TYPE_',$j)
                                let $paymentSourceNickname := concat('PAYMENT_SOURCE_NICK_NAME_',$j)
                                let $MIN := concat('MIN_',$j,'_','0')
                                let $deviceNickName := concat('NICK_NAME_',$j,'_','0')
                                let $ESN := concat('SERIAL_NUMBER_',$j,'_','0')
                                let $groupName := concat('GROUP_NAME_',$j)
                                let $e911Tax := concat('TOTAL_E911_TAX_',$j)
                                let $rcrfTax := concat('TOTAL_RCRF_TAX_',$j)
				let $salesTax := concat('TOTAL_TAX_',$j)
				let $usfTax := concat('TOTAL_USF_TAX_',$j)
				let $transactionTotalWithoutDiscountAndTax := concat('SUBTOTAL_AMOUNT_',$j)                                
                                let $transactionChannel := concat('REQUEST_SOURCE_',$j)
                                
								
                return
                        if(data($getPaymentHistory1/*[local-name() eq $ESN])!='')then
   
              <ns4:transaction>
                              
                <ns4:trasactionInfo>
                
                {
                    if(data($getPaymentHistory1/*[local-name() eq $transactionDate])!= '')then
                    <ns2:transactionDate>{ data($getPaymentHistory1/*[local-name() eq $transactionDate]) }</ns2:transactionDate>
                    else
                    ()
                }
                {
                    if(data($getPaymentHistory1/*[local-name() eq $transactionType])!= '')then
                    <ns2:transactionType>{ data($getPaymentHistory1/*[local-name() eq $transactionType]) }</ns2:transactionType>
                	 else
                    ()
                }
                {
                    if(data($getPaymentHistory1/*[local-name() eq $transactionTotal])!= '')then
                    <ns2:transactionTotal>{ xs:double(data($getPaymentHistory1/*[local-name() eq $transactionTotal]))}</ns2:transactionTotal>
                	else
                    ()
                }
                {
                    if(data($getPaymentHistory1/*[local-name() eq $discountTotal])!= '')then
                    <ns2:discountTotal>{ xs:double(data($getPaymentHistory1/*[local-name() eq $discountTotal]))}</ns2:discountTotal>
                	else
                    ()
                }
                
                {
                    if(data($getPaymentHistory1/*[local-name() eq $transactionId])!= '')then
                    <ns2:transactionId>{ data($getPaymentHistory1/*[local-name() eq $transactionId]) }</ns2:transactionId>
                	else
                    ()
                }
                {
                    if(data($getPaymentHistory1/*[local-name() eq $transactionStatus])!= '')then
                    <ns2:transactionStatus>{ data($getPaymentHistory1/*[local-name() eq $transactionStatus]) }</ns2:transactionStatus>
                	else
                    ()
                }                
                {
                    if(data($getPaymentHistory1/*[local-name() eq $transactionTotalWithoutDiscountAndTax])!= '')then
                    <ns2:transactionTotalWithoutDiscountAndTax>{ data($getPaymentHistory1/*[local-name() eq $transactionTotalWithoutDiscountAndTax]) }</ns2:transactionTotalWithoutDiscountAndTax>
                    else
                    ()
                }
                {
                    if(data($getPaymentHistory1/*[local-name() eq $transactionChannel])!= '')then
                    <ns2:transactionChannel>{ data($getPaymentHistory1/*[local-name() eq $transactionChannel]) }</ns2:transactionChannel>
                	else
                    ()
                }
                
                </ns4:trasactionInfo>
                <ns4:taxInfo>
                {
                    if(data($getPaymentHistory1/*[local-name() eq $e911Tax])!= '')then
                    <ns2:e911TaxAmount>{ data($getPaymentHistory1/*[local-name() eq $e911Tax]) }</ns2:e911TaxAmount>
                    else
                    ()
		}
                {				
                    if(data($getPaymentHistory1/*[local-name() eq $rcrfTax])!= '')then
                    <ns2:rcrfTaxAmount>{ data($getPaymentHistory1/*[local-name() eq $rcrfTax]) }</ns2:rcrfTaxAmount>
                    else
                    ()
		}
                { 				
                    if(data($getPaymentHistory1/*[local-name() eq $salesTax])!= '')then
                    <ns2:combsTaxAmount>{ data($getPaymentHistory1/*[local-name() eq $salesTax]) }</ns2:combsTaxAmount>
                    else
                    ()
		}
                {				
                    if(data($getPaymentHistory1/*[local-name() eq $usfTax])!= '')then
                    <ns2:usfTaxAmount>{ data($getPaymentHistory1/*[local-name() eq $usfTax]) }</ns2:usfTaxAmount>
                    else
                    ()
                }
                  {				
                    if( (data($getPaymentHistory1/*[local-name() eq $e911Tax])+data($getPaymentHistory1/*[local-name() eq $rcrfTax])+data($getPaymentHistory1/*[local-name() eq $salesTax])+data($getPaymentHistory1/*[local-name() eq $usfTax]))  > 0 )then
                    <ns2:totalTaxAmount>{ round-half-to-even(data($getPaymentHistory1/*[local-name() eq $e911Tax])+data($getPaymentHistory1/*[local-name() eq $rcrfTax])+data($getPaymentHistory1/*[local-name() eq $salesTax])+data($getPaymentHistory1/*[local-name() eq $usfTax]),3) }</ns2:totalTaxAmount>
                    else
                    ()
                }
                {				
                     if(data($getPaymentHistory1/*[local-name() eq $transactionTotal])!= '')then
                    <ns2:totalAmountWithTaxes>{ xs:double(data($getPaymentHistory1/*[local-name() eq $transactionTotal]))}</ns2:totalAmountWithTaxes>
                    else
                    ()
                }              
                </ns4:taxInfo>
                <ns4:paymentSource>
              	{
                    if(data($getPaymentHistory1/*[local-name() eq $paymentSourceNickname])!= '')then
                   <ns2:paymentSourceNickname>{ data($getPaymentHistory1/*[local-name() eq $paymentSourceNickname]) }</ns2:paymentSourceNickname>
                   else
                    ()
                }
                {
                    if(data($getPaymentHistory1/*[local-name() eq $paymentSourceType])!= '')then
                   <ns2:paymentSourceType>{ data($getPaymentHistory1/*[local-name() eq $paymentSourceType]) }</ns2:paymentSourceType>
                   else
                    ()
                }
                {
                    if(data($getPaymentHistory1/*[local-name() eq $paymentSourceNumberMask])!= '')then
                   <ns2:paymentSourceNumberMask>{ data($getPaymentHistory1/*[local-name() eq $paymentSourceNumberMask]) }</ns2:paymentSourceNumberMask>
                   else
                    ()
                }
                </ns4:paymentSource>
                <ns4:device>
                {
                    if(data($getPaymentHistory1/*[local-name() eq $deviceNickName])!= '')then
                   <ns2:deviceNickName>{ data($getPaymentHistory1/*[local-name() eq $deviceNickName]) }</ns2:deviceNickName>
                   else
                    ()
                }
                {
                    if(data($getPaymentHistory1/*[local-name() eq $MIN])!= '')then
                   <ns2:min>{ data($getPaymentHistory1/*[local-name() eq $MIN]) }</ns2:min>
                   else
                    ()
                }
                 {
                    if(data($getPaymentHistory1/*[local-name() eq $ESN])!= '')then
                   <ns2:esn>{ data($getPaymentHistory1/*[local-name() eq $ESN]) }</ns2:esn>
                   else
                    ()
                }
                </ns4:device>
                <ns4:group>
                
                  {
		                    if(data($getPaymentHistory1/*[local-name() eq $groupName])!= '')then
		                   <ns4:groupName>{ data($getPaymentHistory1/*[local-name() eq $groupName]) }</ns4:groupName>
		                   else
		                    ()
                }
                </ns4:group>
                
           </ns4:transaction>
           else()
           
           
              }
           </ns4:transactionList>
        </ns4:getTransactionHistoryResponse>
};

declare variable $getPaymentHistory1 as element() external;

xf:CBO2GetTransactionHistoryResponse($getPaymentHistory1)