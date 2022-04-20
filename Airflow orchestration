from airflow import DAG
from airflow.operators.python import PythonOperator, BranchPythonOperator
from chess_snowflake import list, stats, info


def upload_file_to_S3(filename, key, bucket_name):
    hook = S3Hook('s3_list')
    hook.load_file(filename=filename, key=key, bucket_name=bucket_name)


default_args = {
    'owner': 'airflow',
    'start_date': datetime(2022,1,1),
    'retry_delay':timedelta(minutes=5)
}

with DAG(
    dag_id='s3_list',
    schedule_interval='@hourly',
    start_date=datetime(2022, 1, 1),
    catchup=False
) as dag:

start_operator = DummyOperator(task_id='Begin_execution', dag=dag)

    # Upload the file
task_upload_list_to_s3 = PythonOperator(
    task_id='upload_list_to_s3',
    python_callable=upload_list_to_s3,
    op_kwargs={
        'filename': list,
        'key': 'list',
        'bucket_name': 'my-chess-bucket'
    }
)

task_upload_stats_to_s3 = PythonOperator(
    task_id='upload_stats_to_s3',
    python_callable=upload_stats_to_s3,
    op_kwargs={
        'filename': stats,
        'key': 'stats',
        'bucket_name': 'my-chess-bucket'
    }
)

task_upload_info_to_s3 = PythonOperator(
    task_id='upload__info_to_s3',
    python_callable=upload_info_to_s3,
    op_kwargs={
        'filename': info,
        'key': 'info',
        'bucket_name': 'my-chess-bucket'
    }
)

end_operator = DummyOperator(task_id ='Stop_execution', dag=dag)

start_operator >> task_upload_list_to_s3
start_operator >> task_upload_stats_to_s3
start_operator >> task_upload_info_to_s3
task_upload_list_to_s3 >> end_operator
task_upload_stats_to_s3 >> end_operator
task_upload_info_to_s3 >> end_operator
