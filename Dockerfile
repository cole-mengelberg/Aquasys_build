FROM public.ecr.aws/lambda/python:3.9

# Copy requirements.txt and install dependencies
COPY requirements.txt ${LAMBDA_TASK_ROOT}
RUN pip install -r ${LAMBDA_TASK_ROOT}/requirements.txt --target "${LAMBDA_TASK_ROOT}"

# Copy the application code
COPY . ${LAMBDA_TASK_ROOT}

# Set the Lambda handler
CMD ["app.handler"]
