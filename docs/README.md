### 1. dbt kods atrodas dbt/insurance_analytics

    1.c. No customers var atvasināt dim_customer_segments, dim_locations, pii_dim_customers
    1.e. No policies var atvasināt dim_policy_statuses, dim_products, dim_sales_channels

### 2. kods atrodas dbt/insurance_analytics/models/2_gold
    
    2.d. Risinājums būtu veidot atsevišķas faktu tabulas katrai uzskaitāmajai lietai , nevis veidot kopīgas faktu tabulas. Šis risinājums, atvieglotu skaitīšanu, kā arī sasaistīšanu ar dimensiju tabulām

### 3. kods atrodas python/data_quality.py
    
    3.b. Izveidotā risinājuma dati noteikti atvieglo pēdējā piedāvājuma sameklēšanu. Iepriekšējie piedāvājumi netiek ņemti vērā, taču ja ne tikai pēdājais piedāvājums ir svarīgs, tad tie dati būtu jāmeklē citur.
    3.d. Šie parametri var tikt grupēti atsevišķās tabulās katram laikam periodam (dim_offers_day), bet manuprāt nav problēmu, atstāt tos vienā tabulā, kā pašlaik.
    
### 4. kods atrodas dbt/insurance_analytics/tests.
    
    - Datu kvalitātes vājības: 
      - claim date not between policy start and end dates
      - claim amount larger than insured sum amount

### 5. diagramma atrodas pipelines mapē

### 6. modelis atrodas bi mapē

### Palaistu lokāli:
   ```
   pip install -r requirements.txt
   ```
   ```
   dbt run --project-dir dbt/insurance_analytics --profiles-dir dbt/insurance_analytics
   ```
   ```
   dbt test --project-dir dbt/insurance_analytics --profiles-dir dbt/insurance_analytics
   ```
   ```
   python python/data_quality.py
   ```

### ChatGPT tika izmantots priekš dbt schema.yml izveides, nosaukuma 'insurance_analytics' izveidei, DuckDB integrācijai ar dbt, un erroru atrisināšanai