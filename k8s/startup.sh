echo "********************* Initializing rabbitmq *********************"
cd rabbitmq
kubectl apply -f rabbitmq-namespace.yml && kubectl apply -f rabbitmq-configmap.yml && kubectl apply -f rabbitmq-pvc.yml && kubectl apply -f rabbitmq-deployment.yml && kubectl apply -f rabbitmq-service.yml &&
echo "********************* Rabbitmq started *********************"
sync

echo "********************* Initializing user serivce *********************"
cd ../uService-user
kubectl -n backend apply -f postgres-configmap.yml && kubectl -n backend apply -f user-configmap.yml && kubectl -n backend apply -f postgres-secret.yml && kubectl -n backend apply -f postgres.yml && kubectl -n backend apply -f user-service.yml
echo "********************* User service started *********************"
sync

echo "********************* Initializing lodging serivce *********************"
cd ../uService-lodging
kubectl -n backend apply -f postgres-configmap.yml && kubectl -n backend apply -f postgres-secret.yml && kubectl -n backend apply -f postgres.yml && kubectl -n backend apply -f lodging-configmap.yml && kubectl -n backend apply -f lodging-service.yml
echo "********************* Lodging service started *********************"
sync

echo "********************* Initializing reservation serivce *********************"
cd ../uService-reservation
kubectl -n backend apply -f postgres-configmap.yml && kubectl -n backend apply -f postgres-secret.yml && kubectl -n backend apply -f postgres.yml && kubectl -n backend apply -f reservation-configmap.yml && kubectl -n backend apply -f reservation-service.yml
echo "********************* Reservation service started *********************"
sync

echo "********************* Initializing notification serivce *********************"
cd ../uService-notification
kubectl -n backend apply -f postgres-configmap.yml && kubectl -n backend apply -f postgres-secret.yml && kubectl -n backend apply -f postgres.yml && kubectl -n backend apply -f notification-configmap.yml && kubectl -n backend apply -f notification-service.yml
echo "********************* Notification service started *********************"
sync

echo "********************* Initializing rating serivce *********************"
cd ../uService-rating
kubectl apply -f mongo-pvc.yml && kubectl apply -f mongo-deployment.yml && kubectl apply -f rating-service-configmap.yml && kubectl apply -f rating-service-deployment.yml
sync

echo "********************* Frontend service started *********************"
cd ../frontend
kubectl -n backend apply -f fe-configmap.yml && kubectl -n backend apply -f fe-deployment.yml && kubectl -n backend apply -f fe-service.yml && kubectl -n backend apply -f fe-load-balancer-service.yml 
sync
echo "********************* Frontend service started *********************" 

echo "********************* Rating service started *********************"
cd ../
kubectl -n backend apply -f ingress.yml
sync
echo "********************* Started ingress *********************" 