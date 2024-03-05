NOTE: 
1. run cmnd: pip install google-cloud-storage
2. python file_name.py

-------------------------------------------------------------

from google.cloud import storage

def delete_bucket(bucket_name):
    # Create a client to interact with Google Cloud Storage
    client = storage.Client()

    # Get the specified bucket
    bucket = client.get_bucket(bucket_name)

    # Delete the bucket
    bucket.delete(force=True)

    print("Bucket '{}' deleted successfully.".format(bucket_name))

# Replace 'your_bucket_name' with the actual name of the GCS bucket you want to delete
delete_bucket('your_bucket_name')
