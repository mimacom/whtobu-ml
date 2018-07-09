import turicreate as tc

tc.config.set_num_gpus(-1)

# Load the data
data =  tc.SFrame('collection.sframe')

# Make a train-test split
train_data, test_data = data.random_split(0.8)

# Create the model
#model = tc.image_classifier.create(train_data, target='label', max_iterations=1000, model='VisionFeaturePrint_Screen')
model = tc.image_classifier.create(train_data, target='label', verbose=True, max_iterations=100, model='squeezenet_v1.1')

# Save predictions to an SArray
predictions = model.predict(test_data)

# Evaluate the model and save the results into a dictionary
metrics = model.evaluate(test_data)
print(metrics['accuracy'])

# Save the model for later use in Turi Create
model.save('product.model')

# Export for use in Core ML
model.export_coreml('ProductClassifier.mlmodel')
