CREATE LOGIN data_analyst WITH PASSWORD = 'DataAnalyst123!';
CREATE USER data_analyst FOR LOGIN data_analyst;

GRANT SELECT ON orders TO data_analyst;
GRANT SELECT ON customers TO data_analyst;
GRANT SELECT ON products TO data_analyst;
GRANT SELECT ON stores TO data_analyst;

CREATE LOGIN etl_engineer WITH PASSWORD = 'ETLengine2024!';
CREATE USER etl_engineer FOR LOGIN etl_engineer;

GRANT SELECT, INSERT, UPDATE, DELETE ON orders TO etl_engineer;
GRANT SELECT, INSERT, UPDATE, DELETE ON customers TO etl_engineer;
GRANT SELECT, INSERT, UPDATE, DELETE ON products TO etl_engineer;
GRANT SELECT, INSERT, UPDATE, DELETE ON stores TO etl_engineer;

CREATE LOGIN dashboard_viewer WITH PASSWORD = 'DashViewer#1!';
CREATE USER dashboard_viewer FOR LOGIN dashboard_viewer;

GRANT SELECT ON orders TO dashboard_viewer;
GRANT SELECT ON products TO dashboard_viewer;
GRANT SELECT ON stores TO dashboard_viewer;

CREATE LOGIN dev_tester WITH PASSWORD = 'DevTest@2024';
CREATE USER dev_tester FOR LOGIN dev_tester;

GRANT SELECT, INSERT ON orders TO dev_tester;
GRANT SELECT, INSERT ON products TO dev_tester;