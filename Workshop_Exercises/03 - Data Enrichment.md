## Exercise 3: Data Enrichment

This exercise focuses on **data enrichment** using **Dataflow Gen2** and **Notebooks**. The transformed data will then be stored in **SQL Database in Microsoft Fabric**. This is a low-code/no-code solution improving time to market and IT efficiency for Contoso.

---
>**Note:** Follow the steps provided in the task below. The Click-by-Click is available as a **backup** option in case of any technical issues preventing you from performing the lab in the actual environment.
Before starting this exercise, open a backup Click-by-Click using the following hyperlink in a new tab, then return to the browser.
[Click-by-Click](https://regale.cloud/Microsoft/play/4469/03-data-enrichment#/0/0)
---

### Task 3.1: Enrich Data using DataFlow Gen2

#### Activity: Set up a Lakehouse in Fabric and load data.

Now, let's see how each department can easily create a Lakehouse in the Contoso workspace without any provision. They simply provide a name, given the proper access rights of course!

1. Click on **Workspaces** and select the **<inject key="WorkspaceName" enableCopy="false"/>** workspace.

   ![](../media/new2.png)

2. Click on **+ New item** then search and select **Lakehouse** under the **Store data** option.

   ![](../media/lakehouse1.png)

    **Note:** Screenshots in the exercises may sometimes differ from the actual lab. Please adjust your screen resolution to locate items and select them as needed.

3. In the **Name** field, enter ``Lakehouse``.

    ```
    Lakehouse
    ```

4. Click and enable the **Lakehouse schemas** checkbox, then click on the **Create** button.

   ![task-1.2.3.png](../media/lakehouse2.png)

    >**Note:** Do not forget to enable the **Lakehouse schemas** checkbox.

    >**Note:** Expand the **Explorer** if it is collapsed.

    ![task-1.2.3.png](../media/lakehouse3.png)

    Bingo! In just a few seconds, the Lakehouse is ready. With the right access, you, as a Data Engineer, can effortlessly create a new Lakehouse. There is no need to set up any storage accounts or worry about network, infrastructure, key vault, Azure subscriptions, etc.

---

#### Activity: Use the ‘New Shortcut’ option from external data sources

Now, this is something exciting! This section shows how easy it is to create Shortcuts without moving data. That is the power of OneLake!

1. Click on the **three dots (ellipses)** on the right side of **Files** and select the **New shortcut** option.

    >**Note:** Make sure you create a shortcut under **files** and not under **tables** in the explorer pane.

   ![task-wb5.png](../media/task-wb5.png)

2. In the pop-up window, under **External sources**, select the **Azure Data Lake Storage Gen2** source.

   ![task-1.3-ext-shortcut4.png](../media/task-1.3-ext-shortcut4.png)

   >**Note:** Wait for the screen to load.

3. Select the **Create new Connection** radio button.

4. In the screen below, we need to enter the connection details for the ADLS Gen2 shortcut.

   ![task-1.3-ext-shortcut11.png](../media/lakehouse4.png)


5. Paste the below endpoint  under the URL field.

   **URL:** <inject key="StorageEndpoint" enableCopy="true"/>

9.  In the **Authentication kind** dropdown, select **Organizational Account**.

10. Ensure You are signedin as <inject key="Username" enableCopy="false"/>

11. Click on the **Next** button.
  
    ![task-1.3-ext-shortcut9.png](../media/lakehouse.png)

<!--
6. In the **URL** field, type the endpoint: ```https://stfabcon[suffix].dfs.core.windows.net/```.

7. In the **Authentication kind** dropdown, select **Account Key**.

8. In the **Account Key** field, paste the following key: ```[Accountkey]``` 

9. Click on the **Next** button.
-->


14. Click on the **data** directory, select the checkbox, and then click the Next button.

    ![task-wb6.png](../media/f4.png)

15. Click on the **Create** button.

    ![task-1.3-ext-shortcut10.png](../media/f5.png)

    And there you go! Your shortcut is now ready! 

17. Click on (do not expand) the newly created shortcut named **data**.

    ![task-wb7.png](../media/f6.png)

    Prior to Microsoft Fabric, departments in Contoso had to move the data they needed from other departments via time-consuming ETL processes. But look, now they have created shortcuts. No need to move any of this data. That is the power of OneLake!

---

#### Activity: Create a new dataflow gen2 in Fabric to process raw data from Lakehouse

1. Click on **Workspaces** and select the **<inject key="WorkspaceName" enableCopy="false"/>** workspace.

    ![](../media/new2.png)

2. Click on **+New item** and search for **Dataflow** then select **Dataflow Gen2**

   ![](../media/f7.png)

3. If pop-up appears On the  **Name** field, enter ``Dataflow2`` and click on **create**

   ![](../media/f57.png)

   > **Note:** If the pop-up does not appear, wait for 30 seconds for Dataflow Gen 2 to be created.

4. Click on the **Get data** icon (**do not click on the dropdown arrow at the bottom of the icon**).

   ![](../media/dfgen2.3.png)

    >**Note:** If the **Get Data** icon is not visible, expand **New Query** and select the **Get Data** option.

    ![](../media/new3.png)
5. When prompted to **Choose data source**, select **Lakehouse** under **OneLake catalog** .

   ![](../media/f9.png)

   >**Note :** If you don't see fabcon_database, click the ellipsis in the top right corner and adjust JumpVM's screen resolution to 90%.

   ![](../media/new3u.png)

6. Expand **Lakehouse**, **Files** and then **data**. 

7. Select the **sales_data.csv** checkbox, then **click** on the **Create** button.

   ![](../media/f10.png)

8. Collapse the **Queries** pane and take a look at the sales dataset (**Note that the first row of this dataset is not a header**).

   ![alt text](../media/f11.png)

   > **Let's use Copilot to perform data cleansing.**

9. Click on the **Copilot** button, paste the following **prompt** provided in the textbox and click on **Send** icon.

    ```
    In the table sales_data csv, apply first row as headers.
    ```

    ![alt text](../media/g16.png)

    **Note :** If the Copilot option is not visible, click on the arrow to reveal it.

    ![alt text](../media/copilotarrow.png)



**Note:** If Copilot needs additional context to understand your query, consider rephrasing the prompt to include more details.

10. Scroll to the right hand side and observe the **GrossRevenue** and **NetRevenue** columns (**There are some empty rows with null values**).

    ![alt text](../media/f13.png)

    > **Let's use Copilot to remove empty rows.**

11. Similarly, paste the prompt below in Copilot and click on the **send** icon.

    ```
    Remove empty rows from GrossRevenue and NetRevenue columns.
    ```

    ![alt text](../media/f58.png)

12. Scroll to the right-hand side and observe the **GrossRevenue** and **NetRevenue** columns (**There are no empty rows with null values**).

    ![alt text](../media/f14.png)

13. Click on **Add data destination** under **Query settings** and select **SQL database** from the dropdown.

    ![](../media/datadestination1.png)

    ![](../media/datadestination2.png)

14. On **Connect to data destination** and click on the **Next** button.

    ![](../media/datadestination3.png)

15. Expand the **<inject key="WorkspaceName" enableCopy="false"/>**, click on **Fabcon_database**, enter ``sales_data`` in the **Table name** field, and then click the Next button.

    ```
    sales_data
    ```

    >**Note:** It is important to use the provided table name, as it will be used in subsequent exercises.

    ![](../media/datadestination4.png)

16. Click on the **Save settings** button.

    ![](../media/f18.png)

17. Click on the **Publish** button in the bottom right corner.

    ![alt text](../media/f21.png)


---

#### Activity: Use pipeline activities to load transformed data into SQL Database

1. Click on **Workspaces** and select the **<inject key="WorkspaceName" enableCopy="false"/>** workspace.

    ![](../media/new2.png)

2. Click on **+ New item** and select **Data pipeline** under **Get data**.

   ![](../media/datapipeline2.png)

3. In the name field, enter ``load transformed data into in the SQL Database`` and click on the **Create** button.

    ```
    load transformed data into in the SQL Database
    ```

    ![](../media/f19.png)

4. Click on **Dataflow** from the ribbon. Click on **Settings** and then select **Dataflow** which you have created in previous activity from the **Dataflow** dropdown.

   ![](../media/f20.png)

    Let's schedule the pipeline to reduce manual effort and ensure data is always up to date.

5. Under the **Run** tab, click on **Schedule** from the ribbon.

   ![](../media/runschedule.png)

6. Turn **On** the **Scheduled run** radio button.

7. In the **Repeat** dropdown, select **Daily**.

8. In the **Time** dropdown, select any preferred time.

9. Set the **Start Date and time** and **End Date and time** as needed.

10. Click on **Apply** to save the schedule and close the Schedule Window from the top right corner.

    ![](../media/f22.png)

11. From the ribbon, click the **Save** button.

    ![](../media/f71.png)

### Task 3.2: Advanced Data enrichment with Notebooks

#### Activity: Get JDBC URL
 
 1. Click on the **<inject key="WorkspaceName" enableCopy="false"/>** workspace from the left menu.
 
     ![](../media/new5u.png)
 
 2. Click on the three dots next to **Fabcon_database** and click on **Settings**.
 
    ![](../media/task_3.2.0.1.png)
 
 3. Click on **Connection strings**, go to **JDBC** tab, copy the **JDBC URL** and save it in the notepad separately to use later.
 
    ![](../media/task_3.2.0.2.png)


#### Activity: Adding the requried Service Principal to the workspace.

1. Navigate back to workspace and Click on **Manage Access** in the top right corner of the workspace.

   ![](../media/new6u.png)

2. Select **+ Add People or Groups**.

   ![](../media/image8u.png)

3. In the **Add People** window, enter ``sp-fabcon-lab``, select **Admin access**, and click **Add**.
   
   ```
   sp-fabcon-lab
   ```

   ![](../media/image9u.png)

#### Activity: Create a Notebook in the Fabric workspace and process data

1. Click on the **<inject key="WorkspaceName" enableCopy="false"/>** workspace from the left menu.

   ![](../media/new5u.png)

2. Click on **+ New item**, search for **notebook** in the search bar, and then select **Notebook**.

   ![](../media/task_3.2.1.2.png)

    > **Note:** If any pop-up appears like below, click on the **Skip tour**.

    ![](../media/task_3.2.1.14.png)

3. Click on the name of the notebook on top left corner and change it to **factsalesdata_notebook**.

    > **Note:** After changing the name, click anywhere outside the popup window to save the Notebook name.

    ![](../media/task_3.2.1.3.png)

4. Click on **Lakehouses** from the left side menu.

   ![](../media/task_3.2.1.4.png)

5. Click on the **Add** button.

   ![](../media/task_3.2.1.5.png)

6. Click on the **Add** button.

   ![](../media/task_3.2.1.6.png)

7. Select the checkbox next to **Lakehouse** and then click on the **Add** button.

   ![](../media/task_3.2.1.7.png)

8. Copy and paste the following code in the notebook cell and Replace **jdbc_url** with the copied value from the **Get URL** activity.

    ``` 
    # Define JDBC connection parameters

    jdbc_url = "<jdbc_url>"
    jdbc_properties = {
        "user": f"173c7875-69b5-4d9b-9bf1-0898bb590773@79fe009c-79e0-4bc9-baec-a76d3145bde5",
        "password": "<inject key="ClientSecret" enableCopy="false"/>",
        "driver": "com.microsoft.sqlserver.jdbc.SQLServerDriver"
    }

    # Read tables from Fabric SQL using JDBC

    sales_data = spark.read.jdbc(url=jdbc_url, table="sales_data", properties=jdbc_properties)
    dimcustomer = spark.read.jdbc(url=jdbc_url, table="dimcustomer", properties=jdbc_properties)

    # Register tables in Spark SQL

    sales_data.createOrReplaceTempView("sales_data")
    dimcustomer.createOrReplaceTempView("dimcustomer")

    # Use Spark SQL for transformation

    sales_metrics = spark.sql("""
        SELECT 
            CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
            ROUND(SUM(s.NetRevenue), 2) AS TotalSalesRevenue,
            ROUND(SUM(s.GrossRevenue), 2) AS TotalGrossRevenue,
            ROUND(SUM(s.GrossProfit), 2) AS TotalGrossProfit,
            ROUND(SUM(s.NetRevenue) - SUM(s.COGS), 2) AS NetProfit,
            ROUND(SUM(s.NetRevenue) / COUNT(DISTINCT s.CustomerId), 2) AS AverageOrderValue,
            ROUND(SUM(s.NetRevenue) / COUNT(DISTINCT s.ProductId), 2) AS RevenuePerProduct,
            ROUND(SUM(s.Quantity), 2) AS TotalQuantitySold,
            ROUND(SUM(s.Discount) / SUM(s.GrossRevenue), 2) AS DiscountRate,
            ROUND(SUM(s.Discount) / COUNT(DISTINCT s.CustomerId), 2) AS AverageDiscountPerOrder,
            ROUND(SUM(s.COGS), 2) AS TotalCOGS,
            ROUND((SUM(s.GrossProfit) / SUM(s.GrossRevenue)) * 100, 2) AS GrossProfitMargin,
            ROUND(((SUM(s.NetRevenue) - SUM(s.COGS)) / SUM(s.NetRevenue)) * 100, 2) AS NetProfitMargin,
            ROUND(SUM(s.TaxAmount), 2) AS TotalTaxAmount,
            ROUND(SUM(s.NetRevenue), 2) AS CustomerLifetimeValue,
            ROUND(AVG(s.NetRevenue), 2) AS SalesPerCustomer,
            ROUND(SUM(s.NetRevenue) / SUM(s.Quantity), 2) AS AverageUnitPrice,
            ROUND(SUM(s.COGS) / SUM(s.Quantity), 2) AS COGSPerUnit,
            ROUND(SUM(s.TaxAmount) / SUM(s.TotalIncludingTax), 2) AS TaxRate
        FROM sales_data s
        JOIN dimcustomer c ON s.CustomerId = c.CustomerKey
        GROUP BY c.FirstName, c.LastName
    """)

    # Write results back to Fabric SQL

    sales_metrics.write.jdbc(url=jdbc_url, table="SalesMetricsTable", mode="overwrite", properties=jdbc_properties)

    ```

   ![](../media/task_3.2.1.7_1.png)

9. Scroll to the end of **jdbc_url** and change the value for **authentication** as **ActiveDirectoryServicePrincipal**.

   ![](../media/task_3.2.1.7_2.png)

10. Click on the **Run** icon.

    This code connects to a Fabric SQL database using JDBC, retrieves the top 1000 rows from the SalesMetricsTable, loads them into a Spark DataFrame, and displays the results in a Fabric Notebook.

    ![](../media/task_3.2.1.8.png)

11. Wait for the code to run successfully.

    ![](../media/task_3.2.1.9.png)

12. Hover below the current cell to click on **Add code cell**, then paste the following code in the cell, and click on the **Run** icon to display the results.

    ``` 
    # Read data from SalesMetricsTable using JDBC (with LIMIT)

    query = "(SELECT TOP 1000 * FROM dbo.SalesMetricsTable) AS SalesMetricsTable"

    # Load the data into a Spark DataFrame

    df = spark.read.jdbc(url=jdbc_url, table=query, properties=jdbc_properties)

    # Display the DataFrame

    display(df)
    ``` 

    ![](../media/task_3.2.1.10.png)

13. Click on the **<inject key="WorkspaceName" enableCopy="false"/>** workspace in the left menu.

    ![](../media/new5u.png)

14. Click on **Filter**, select **SQL database**, and then click on **Fabcon_database**.

    ![](../media/task_3.2.1.12.png)

15. Once in the **SQL Database** under the **Explorer**, expand *Fabcon_database*, then expand the **dbo schema** and the Tables section. Scroll down to locate the **SalesMetricsTable**.

   ![](../media/fabcondatabase.png)
 
16. Click on **SalesMetricsTable** to see the results.

    ![](../media/task_3.2.1.13.png)

    > **Note:** If the SalesMetricsTable table is not visible in Fabcon_database, click on the ellipsis (...) and select Refresh.

    ![](../media/refresh1.png)


In this exercise, you have learned how to enrich data using Dataflow Gen2 and Notebooks in Microsoft Fabric. You have gained practical experience in:

- Creating and utilizing Dataflow Gen2 to process raw data efficiently.
- Using pipeline activities to load transformed data into a **SQL Database**.
- Leveraging Notebooks with PySpark or Spark SQL for advanced data processing.
- Saving enriched data into the **SQL Database** for further analysis.
 With these skills, you can now efficiently process, transform, and enrich large datasets using Fabric's powerful tools.

You are ready to move on to the next exercise: Data Serving.
