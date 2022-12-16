FROM amazon/aws-lambda-python:3.9

ARG FUNCTION_DIR="/var/task/"

COPY ./Pipfile ${FUNCTION_DIR}
COPY ./Pipfile.lock ${FUNCTION_DIR}

# Setup Python environment
RUN pip install pipenv
# activateができなかったためsystemのpythonにインストールをした
RUN pipenv install --system --deploy

COPY ./project ${FUNCTION_DIR}

# Grab the zappa handler.py and put it in the working directory
RUN ZAPPA_HANDLER_PATH=$( \
    python -c "from zappa import handler; print (handler.__file__)" \
    ) \
    && echo $ZAPPA_HANDLER_PATH \
    && cp $ZAPPA_HANDLER_PATH ${FUNCTION_DIR}

CMD ["handler.lambda_handler"]
