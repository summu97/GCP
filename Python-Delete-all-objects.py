NOTE:
1. run cmnd: pip install google-cloud-storage
2. python file_name.py
-------------------------------------------------------------------
from google.cloud import storage

def delete_objects(bucket_name):
    # Create a client to interact with Google Cloud Storage
    client = storage.Client()

    # Get the specified bucket
    bucket = client.get_bucket(bucket_name)

    # List all objects in the bucket
    blobs = bucket.list_blobs()

    # Delete each object in the bucket
    for blob in blobs:
        blob.delete()

    print("All objects in bucket '{}' deleted successfully.".format(bucket_name))

# Replace 'your_bucket_name' with the actual name of the GCS bucket
delete_objects('your_bucket_name')
