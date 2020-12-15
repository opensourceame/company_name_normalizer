describe 'something' do

  NORMALIZATIONS = {
    'Hymcor - Hierros y Metales Córdoba S. A.'       => 'HymcorHierrosYMetalesCordoba',
    'Dongkuk Industries Co.Ltd.,'                    => 'DongkukIndustries',
    'St. Arnold Enterprises'                         => 'StArnoldEnterprises',
    '7 Stones'                                       => '7Stones',
    'SHUAAB MAKKAH METAL SCRAPS TR.L.L.C.'           => 'ShuaabMakkahMetalScraps',
    'J T L Steel Industries'                         => 'JTLSteelIndustries',
    'J.T.L. Steel Industries'                        => 'JTLSteelIndustries',
    'Batala Group Of Steel Industries'               => 'BatalaGroupOfSteelIndustries',
    'TECNOSID S R L'                                 => 'Tecnosid',
    'MORTEX (INDIA) LLC'                             => 'Mortex',
    'A+M Febcon Pvt Ltd.'                            => 'A&MFebcon',
    'A & M Febcon Ltd.'                              => 'A&MFebcon',
    'A AND M Febcon Ltd.'                            => 'A&MFebcon',
    'A Touch of Class'                               => 'ATouchOfClass',
    'A-1 Acid Ltd.'                                  => 'A1Acid',
    'AL SAHAM TRADING LLC'                           => 'AlSahamTrading',
    'ITALIANA COKE S.R.L. VIA STALINGRADO'           => 'ItalianaCoke',
    'FRP SERVICES (ASIA) PTE LTD'                    => 'FrpServices',
    'Karl SCHMIDT GMBH'                              => 'KarlSchmidt',
    'ANN AIK PTE LTD'                                => 'AnnAik',
    'SINOMETAL RESOURCE INTERNATIONAL SINGAPORE PTE' => 'SinometalResourceInternationalSingapore',
    'MGK INTERNATIONAL DWC-LLC'                      => 'MgkInternational',
    'M S DSS INTERNATIONAL SA'                       => 'MSDssInternational',
    'PM STEEL AND ALLOYS INDUSTRIES SDN BHD'         => 'PmSteel&AlloysIndustries',
    'SIJ METAL RAVNE D O O'                          => 'SijMetalRavne',
    'BUOYSAIL TR. EST PO BOX 25714'                  => 'BuoysailTrEst',
    'POLCOPPER SP. Z O.O.'                           => 'Polcopper',
    'METAL AND RECYCLING COMPANY K.S.C.C.'           => 'Metal&Recycling',
    'METAL AND RECYCLING COMPANY K S C C'            => 'Metal&Recycling',
    'CROWN INDUSTRIES W.L.L'                         => 'CrownIndustries',

  }

  describe 'test names' do
    NORMALIZATIONS.each do |name, expected_normalization|
      it "should normalize #{name} to #{expected_normalization}" do
        expect(CompanyNameNormalizer.normalize(name)).to eq expected_normalization
      end
    end
  end
end
