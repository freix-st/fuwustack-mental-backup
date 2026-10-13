## A. Message broker architecture
**If System B can be changed to a pull model:**
- System B will only pull as many messages as it can actually process
- Message order doesn't matter
- RabbitMQ, ActiveMQ, AWS SQS

**If we can't change System B's behavior:**

```
[ System A ] 
    |
    |
    |
     ──( Fast Push )──> [ Message Broker ] 
                            |
                            |
                            |
	                         ──> [ Worker/Forwarder ]
                                    |
                                    │ ( Rate limits / Concurrency caps )
                                    |
                                     ──( Controlled Push )──> [ System B ]
```

System A sends to the broker as fast as it wants. The internal worker/forwarder controls the rate at which requests are sent to System B

## B. Event streaming architecture
**If System B can be changed to a pull model:**
- Intermediary will just dump all messages in an append-only log continuously
- System B will read from the log only as many messages as it can actually process at the given time
- Message order matters
- Kafka, Redpanda, AWS Kinesis

**If we can't change System B's behavior:**

Instead of the "worker" in A, we introduce an intermediary consumer. Here, the consumer will be the one doing the pulling for System B and then the push from the intermediary to System B can be rate-limited to our liking.

# Preventing system A from overloading the intermediary
## SQS
- Cloud managed "infinite" queue
- Scales horizontally and automatically
- System A will push as fast as it wants to the SQS, broker will pull from the SQS at a steady pace

## Intentional throttling
- Finite storage
- Broker can delay sending an ACK back to System A
- Broker can trigger a "blocked connection" state
- System A can be set to see if broker's replies are slowing down or if it's in a  blocked connection state

## Forced queue length
- Once system A exceeds the length, deny or send the messages to a DLX (dead letter exchange)