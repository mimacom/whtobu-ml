import turicreate as tc

tc.config.set_runtime_config('TURI_DEFAULT_NUM_PYLAMBDA_WORKERS', 32)

# Load the data
data =  tc.SFrame('images.sframe')

# Make a train-test split
train_data, test_data = data.random_split(0.8)

# Create a model
model = tc.object_detector.create(train_data, feature='image', annotations='annotations')

# Save predictions to an SArray
predictions = model.predict(test_data)

predictions_stacked = tc.object_detector.util.stack_annotations(predictions)
print(predictions_stacked)

# Evaluate the model and save the results into a dictionary
metrics = model.evaluate(test_data)
print(metrics)

# Save the model for later use in Turi Create
model.save('ObjectDetection.model')

# Export for use in Core ML
model.export_coreml('ObjectDetection.mlmodel')